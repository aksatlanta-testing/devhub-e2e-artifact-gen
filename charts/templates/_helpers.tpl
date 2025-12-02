
{{- define "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.fullname" -}}
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


{{- define "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.labels" -}}
helm.sh/chart: {{ include "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.chart" . }}
{{ include "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo212b6187-f1b8-4b39-b647-f52e75aca967.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}