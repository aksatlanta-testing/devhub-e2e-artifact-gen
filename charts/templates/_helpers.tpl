
{{- define "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.fullname" -}}
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


{{- define "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.labels" -}}
helm.sh/chart: {{ include "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.chart" . }}
{{ include "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo68d3e746-1053-4e90-8aac-2c22b0342bda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}