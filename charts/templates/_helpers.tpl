
{{- define "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.labels" -}}
helm.sh/chart: {{ include "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.chart" . }}
{{ include "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0d1d23a8-370b-4ceb-aca9-09fcc3ca5efe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}