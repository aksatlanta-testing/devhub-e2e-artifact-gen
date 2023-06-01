{{/*
Expand the name of the chart.
*/}}
{{- define "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.fullname" -}}
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
{{- define "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.labels" -}}
helm.sh/chart: {{ include "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.chart" . }}
{{ include "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob17e7d4c-f789-442c-ae90-c8a13b9c841c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}