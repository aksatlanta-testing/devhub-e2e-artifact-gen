{{/*
Expand the name of the chart.
*/}}
{{- define "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.fullname" -}}
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
{{- define "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.labels" -}}
helm.sh/chart: {{ include "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.chart" . }}
{{ include "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfeb9149-89c6-4a08-8bd3-5e6450ff5aaf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}