
{{- define "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.fullname" -}}
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


{{- define "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.labels" -}}
helm.sh/chart: {{ include "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.chart" . }}
{{ include "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob22a90da-99f5-4828-aa0d-933c098ea08c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}