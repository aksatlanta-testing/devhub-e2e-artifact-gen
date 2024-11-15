
{{- define "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.fullname" -}}
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


{{- define "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.labels" -}}
helm.sh/chart: {{ include "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.chart" . }}
{{ include "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9e511b9f-5657-4657-8b5c-bbd483dd7d98.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}