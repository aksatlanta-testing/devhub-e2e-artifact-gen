{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.fullname" -}}
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
{{- define "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.labels" -}}
helm.sh/chart: {{ include "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.chart" . }}
{{ include "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7ed55980-c1f6-467f-8ddd-86465b0b4bbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}