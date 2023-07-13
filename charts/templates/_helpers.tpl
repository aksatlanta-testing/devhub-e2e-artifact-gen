{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo686a51e2-58d6-4288-8bde-4171e92db978.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo686a51e2-58d6-4288-8bde-4171e92db978.fullname" -}}
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
{{- define "go-echo686a51e2-58d6-4288-8bde-4171e92db978.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo686a51e2-58d6-4288-8bde-4171e92db978.labels" -}}
helm.sh/chart: {{ include "go-echo686a51e2-58d6-4288-8bde-4171e92db978.chart" . }}
{{ include "go-echo686a51e2-58d6-4288-8bde-4171e92db978.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo686a51e2-58d6-4288-8bde-4171e92db978.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo686a51e2-58d6-4288-8bde-4171e92db978.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}