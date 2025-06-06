
{{- define "go-echof1115756-9125-4054-b3aa-51975cf1c530.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1115756-9125-4054-b3aa-51975cf1c530.fullname" -}}
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


{{- define "go-echof1115756-9125-4054-b3aa-51975cf1c530.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1115756-9125-4054-b3aa-51975cf1c530.labels" -}}
helm.sh/chart: {{ include "go-echof1115756-9125-4054-b3aa-51975cf1c530.chart" . }}
{{ include "go-echof1115756-9125-4054-b3aa-51975cf1c530.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1115756-9125-4054-b3aa-51975cf1c530.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1115756-9125-4054-b3aa-51975cf1c530.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}