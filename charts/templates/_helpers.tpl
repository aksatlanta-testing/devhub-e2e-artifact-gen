
{{- define "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.fullname" -}}
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


{{- define "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.labels" -}}
helm.sh/chart: {{ include "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.chart" . }}
{{ include "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42db5861-7bbf-48e8-aff8-60b9a6a0fa5d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}