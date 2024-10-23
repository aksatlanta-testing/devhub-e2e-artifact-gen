
{{- define "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.fullname" -}}
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


{{- define "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.labels" -}}
helm.sh/chart: {{ include "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.chart" . }}
{{ include "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa913bb46-8ee4-4689-9b8f-a0e154e8e15c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}