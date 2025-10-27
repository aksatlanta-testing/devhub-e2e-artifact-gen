
{{- define "go-echod94b1282-d67e-4c53-9511-78c206e11d34.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod94b1282-d67e-4c53-9511-78c206e11d34.fullname" -}}
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


{{- define "go-echod94b1282-d67e-4c53-9511-78c206e11d34.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod94b1282-d67e-4c53-9511-78c206e11d34.labels" -}}
helm.sh/chart: {{ include "go-echod94b1282-d67e-4c53-9511-78c206e11d34.chart" . }}
{{ include "go-echod94b1282-d67e-4c53-9511-78c206e11d34.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod94b1282-d67e-4c53-9511-78c206e11d34.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod94b1282-d67e-4c53-9511-78c206e11d34.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}