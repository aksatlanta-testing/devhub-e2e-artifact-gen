
{{- define "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.fullname" -}}
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


{{- define "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.labels" -}}
helm.sh/chart: {{ include "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.chart" . }}
{{ include "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc0b8aac-a6cb-447d-8dbb-e3f4d844a1aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}