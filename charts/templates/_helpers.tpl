{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.fullname" -}}
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
{{- define "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.labels" -}}
helm.sh/chart: {{ include "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.chart" . }}
{{ include "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafe980d6-2f4c-409b-b0c7-c46c1d225aab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}