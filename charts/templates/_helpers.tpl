
{{- define "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.fullname" -}}
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


{{- define "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.labels" -}}
helm.sh/chart: {{ include "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.chart" . }}
{{ include "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2368c0a-3de2-4b9f-b9ca-cc6ff8e25b35.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}