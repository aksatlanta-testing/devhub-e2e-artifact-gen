
{{- define "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.fullname" -}}
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


{{- define "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.labels" -}}
helm.sh/chart: {{ include "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.chart" . }}
{{ include "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo498f3837-57af-490d-928b-22b28cbb0f5e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}