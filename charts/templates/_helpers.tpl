{{/*
Expand the name of the chart.
*/}}
{{- define "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.fullname" -}}
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
{{- define "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.labels" -}}
helm.sh/chart: {{ include "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.chart" . }}
{{ include "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf18d6fa-4c9b-4659-a9f7-c1d2968ea10b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}