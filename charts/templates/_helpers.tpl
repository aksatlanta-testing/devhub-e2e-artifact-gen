{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.fullname" -}}
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
{{- define "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.labels" -}}
helm.sh/chart: {{ include "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.chart" . }}
{{ include "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo73d848fb-a668-4166-a98b-946e7755e7bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}