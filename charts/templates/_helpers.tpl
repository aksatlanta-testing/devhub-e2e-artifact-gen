
{{- define "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.fullname" -}}
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


{{- define "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.labels" -}}
helm.sh/chart: {{ include "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.chart" . }}
{{ include "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5f10c18-0d85-4a95-99cc-ebf765a1bf77.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}