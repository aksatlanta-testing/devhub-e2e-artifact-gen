
{{- define "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.fullname" -}}
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


{{- define "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.labels" -}}
helm.sh/chart: {{ include "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.chart" . }}
{{ include "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b9d7873-10f3-49ba-b553-0a0fdf2e52ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}