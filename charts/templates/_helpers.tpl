
{{- define "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.fullname" -}}
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


{{- define "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.labels" -}}
helm.sh/chart: {{ include "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.chart" . }}
{{ include "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod922d38c-3cd6-42ad-a373-9b662e121e32.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}