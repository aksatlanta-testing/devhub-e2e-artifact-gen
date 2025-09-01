
{{- define "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.fullname" -}}
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


{{- define "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.labels" -}}
helm.sh/chart: {{ include "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.chart" . }}
{{ include "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo755b33c0-c520-4cc0-88cf-8df855ff9b8a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}