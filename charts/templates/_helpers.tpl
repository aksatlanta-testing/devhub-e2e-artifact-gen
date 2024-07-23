{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.fullname" -}}
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
{{- define "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.labels" -}}
helm.sh/chart: {{ include "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.chart" . }}
{{ include "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo53c2c2a3-4a10-4d61-830e-7972589d722f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}