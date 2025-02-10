
{{- define "go-echo14122ccd-9133-4d69-b387-e877576f9fff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo14122ccd-9133-4d69-b387-e877576f9fff.fullname" -}}
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


{{- define "go-echo14122ccd-9133-4d69-b387-e877576f9fff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo14122ccd-9133-4d69-b387-e877576f9fff.labels" -}}
helm.sh/chart: {{ include "go-echo14122ccd-9133-4d69-b387-e877576f9fff.chart" . }}
{{ include "go-echo14122ccd-9133-4d69-b387-e877576f9fff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo14122ccd-9133-4d69-b387-e877576f9fff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo14122ccd-9133-4d69-b387-e877576f9fff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}