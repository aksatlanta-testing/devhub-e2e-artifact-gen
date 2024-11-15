
{{- define "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.fullname" -}}
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


{{- define "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.labels" -}}
helm.sh/chart: {{ include "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.chart" . }}
{{ include "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba32c00e-7c36-40b0-9605-f5ca7b400633.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}