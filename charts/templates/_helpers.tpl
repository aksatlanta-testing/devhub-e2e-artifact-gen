
{{- define "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.fullname" -}}
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


{{- define "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.labels" -}}
helm.sh/chart: {{ include "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.chart" . }}
{{ include "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1ebb9057-e993-4fe2-a963-9fc8eae234ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}