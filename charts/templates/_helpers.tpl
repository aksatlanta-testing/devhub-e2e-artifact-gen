
{{- define "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.fullname" -}}
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


{{- define "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.labels" -}}
helm.sh/chart: {{ include "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.chart" . }}
{{ include "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod60ca682-b70e-46d4-8871-5209477f8b5f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}