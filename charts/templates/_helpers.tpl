
{{- define "go-echoed617f42-1e0b-4466-8d02-d75e65278489.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed617f42-1e0b-4466-8d02-d75e65278489.fullname" -}}
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


{{- define "go-echoed617f42-1e0b-4466-8d02-d75e65278489.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed617f42-1e0b-4466-8d02-d75e65278489.labels" -}}
helm.sh/chart: {{ include "go-echoed617f42-1e0b-4466-8d02-d75e65278489.chart" . }}
{{ include "go-echoed617f42-1e0b-4466-8d02-d75e65278489.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed617f42-1e0b-4466-8d02-d75e65278489.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed617f42-1e0b-4466-8d02-d75e65278489.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}