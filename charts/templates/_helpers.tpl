
{{- define "go-echo34facf44-67bd-4da7-9771-9079f80ee462.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34facf44-67bd-4da7-9771-9079f80ee462.fullname" -}}
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


{{- define "go-echo34facf44-67bd-4da7-9771-9079f80ee462.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34facf44-67bd-4da7-9771-9079f80ee462.labels" -}}
helm.sh/chart: {{ include "go-echo34facf44-67bd-4da7-9771-9079f80ee462.chart" . }}
{{ include "go-echo34facf44-67bd-4da7-9771-9079f80ee462.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo34facf44-67bd-4da7-9771-9079f80ee462.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo34facf44-67bd-4da7-9771-9079f80ee462.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}