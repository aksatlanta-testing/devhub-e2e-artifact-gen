{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.fullname" -}}
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
{{- define "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.labels" -}}
helm.sh/chart: {{ include "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.chart" . }}
{{ include "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab8e8ec4-446d-4a81-9c28-4098a4bc2bce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}