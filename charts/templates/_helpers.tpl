
{{- define "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.fullname" -}}
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


{{- define "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.labels" -}}
helm.sh/chart: {{ include "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.chart" . }}
{{ include "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c6ace87-b5b5-4e9f-bf55-6e5f42b02390.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}