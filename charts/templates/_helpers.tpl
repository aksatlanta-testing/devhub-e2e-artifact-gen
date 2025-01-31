
{{- define "go-echod9f571b8-6c67-48d0-861c-46188da31f17.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9f571b8-6c67-48d0-861c-46188da31f17.fullname" -}}
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


{{- define "go-echod9f571b8-6c67-48d0-861c-46188da31f17.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9f571b8-6c67-48d0-861c-46188da31f17.labels" -}}
helm.sh/chart: {{ include "go-echod9f571b8-6c67-48d0-861c-46188da31f17.chart" . }}
{{ include "go-echod9f571b8-6c67-48d0-861c-46188da31f17.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9f571b8-6c67-48d0-861c-46188da31f17.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9f571b8-6c67-48d0-861c-46188da31f17.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}