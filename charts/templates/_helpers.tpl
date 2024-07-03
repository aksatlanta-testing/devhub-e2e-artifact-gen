{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.labels" -}}
helm.sh/chart: {{ include "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.chart" . }}
{{ include "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc280c7fb-0661-4fba-b51f-bdeae37499d8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}