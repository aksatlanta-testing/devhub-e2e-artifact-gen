{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.fullname" -}}
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
{{- define "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.labels" -}}
helm.sh/chart: {{ include "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.chart" . }}
{{ include "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofaad9ff2-2d5d-4315-af94-43d1e0a84a02.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}