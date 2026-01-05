
{{- define "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.fullname" -}}
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


{{- define "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.labels" -}}
helm.sh/chart: {{ include "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.chart" . }}
{{ include "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode96e3b4-8208-4f8b-9b8c-52ab5603ca76.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}