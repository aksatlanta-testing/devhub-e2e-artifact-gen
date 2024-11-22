
{{- define "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.fullname" -}}
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


{{- define "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.labels" -}}
helm.sh/chart: {{ include "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.chart" . }}
{{ include "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdaae44c-5de1-4da5-85b6-7eb75c9e94c7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}