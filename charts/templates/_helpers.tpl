{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.fullname" -}}
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
{{- define "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.labels" -}}
helm.sh/chart: {{ include "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.chart" . }}
{{ include "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d7c435c-7572-47df-913e-fe8e4ebbbd37.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}