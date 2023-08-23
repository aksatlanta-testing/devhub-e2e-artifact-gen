{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.fullname" -}}
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
{{- define "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.labels" -}}
helm.sh/chart: {{ include "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.chart" . }}
{{ include "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa8a5743-19e8-4651-b76b-aaf9e20702dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}