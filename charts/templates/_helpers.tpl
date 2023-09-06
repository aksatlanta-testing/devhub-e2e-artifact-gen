{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.fullname" -}}
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
{{- define "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.labels" -}}
helm.sh/chart: {{ include "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.chart" . }}
{{ include "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8f8e72ca-7043-4240-aa2a-7113c7e935ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}