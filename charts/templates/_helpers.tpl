
{{- define "go-echodb201916-cc41-4a3a-a592-899361046226.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb201916-cc41-4a3a-a592-899361046226.fullname" -}}
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


{{- define "go-echodb201916-cc41-4a3a-a592-899361046226.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb201916-cc41-4a3a-a592-899361046226.labels" -}}
helm.sh/chart: {{ include "go-echodb201916-cc41-4a3a-a592-899361046226.chart" . }}
{{ include "go-echodb201916-cc41-4a3a-a592-899361046226.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb201916-cc41-4a3a-a592-899361046226.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb201916-cc41-4a3a-a592-899361046226.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}