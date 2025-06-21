
{{- define "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.fullname" -}}
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


{{- define "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.labels" -}}
helm.sh/chart: {{ include "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.chart" . }}
{{ include "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1a0549a-220a-4cc2-9553-8bdc9f0ba073.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}