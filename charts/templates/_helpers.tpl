
{{- define "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.fullname" -}}
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


{{- define "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.labels" -}}
helm.sh/chart: {{ include "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.chart" . }}
{{ include "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo26aabc9f-9b56-4c15-9494-d2189e07683d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}