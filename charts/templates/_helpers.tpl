
{{- define "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.fullname" -}}
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


{{- define "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.labels" -}}
helm.sh/chart: {{ include "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.chart" . }}
{{ include "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5abc985b-7dc6-45f3-a9e1-68951e4c39d7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}