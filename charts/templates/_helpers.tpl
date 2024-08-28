{{/*
Expand the name of the chart.
*/}}
{{- define "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.fullname" -}}
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
{{- define "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.labels" -}}
helm.sh/chart: {{ include "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.chart" . }}
{{ include "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd280463-9565-4edf-87c9-d930d30a4ff7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}