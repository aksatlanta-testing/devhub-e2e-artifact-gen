
{{- define "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.fullname" -}}
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


{{- define "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.labels" -}}
helm.sh/chart: {{ include "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.chart" . }}
{{ include "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1349cf92-5f4d-4c0b-8f56-8d948a2c1aa7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}