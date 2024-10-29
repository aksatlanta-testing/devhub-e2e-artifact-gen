
{{- define "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.fullname" -}}
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


{{- define "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.labels" -}}
helm.sh/chart: {{ include "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.chart" . }}
{{ include "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1c8efbf9-9f93-4f39-a4db-90a4977f2a29.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}