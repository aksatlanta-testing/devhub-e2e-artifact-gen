
{{- define "go-echoe437e169-6388-485f-be92-bc69233a60f8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe437e169-6388-485f-be92-bc69233a60f8.fullname" -}}
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


{{- define "go-echoe437e169-6388-485f-be92-bc69233a60f8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe437e169-6388-485f-be92-bc69233a60f8.labels" -}}
helm.sh/chart: {{ include "go-echoe437e169-6388-485f-be92-bc69233a60f8.chart" . }}
{{ include "go-echoe437e169-6388-485f-be92-bc69233a60f8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe437e169-6388-485f-be92-bc69233a60f8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe437e169-6388-485f-be92-bc69233a60f8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}