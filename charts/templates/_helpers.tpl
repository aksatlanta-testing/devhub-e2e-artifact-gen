{{/*
Expand the name of the chart.
*/}}
{{- define "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.fullname" -}}
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
{{- define "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.labels" -}}
helm.sh/chart: {{ include "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.chart" . }}
{{ include "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7b701b9-b6f5-4b60-8fc4-a979a499f675.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}