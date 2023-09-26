{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.fullname" -}}
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
{{- define "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.labels" -}}
helm.sh/chart: {{ include "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.chart" . }}
{{ include "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08b7ece8-65ed-4904-ad0b-4d2e4ab74a18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}