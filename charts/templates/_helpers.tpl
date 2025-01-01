
{{- define "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.fullname" -}}
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


{{- define "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.labels" -}}
helm.sh/chart: {{ include "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.chart" . }}
{{ include "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06dd8025-6dbf-47d2-9581-b2d100a7a668.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}