{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.fullname" -}}
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
{{- define "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.labels" -}}
helm.sh/chart: {{ include "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.chart" . }}
{{ include "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea7a65eb-c74f-49db-921f-bc02547a3aac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}