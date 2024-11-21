
{{- define "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.fullname" -}}
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


{{- define "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.labels" -}}
helm.sh/chart: {{ include "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.chart" . }}
{{ include "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d90f2e4-9cf7-4747-8bc6-7de8b1272d8e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}