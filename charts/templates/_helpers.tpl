
{{- define "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.fullname" -}}
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


{{- define "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.labels" -}}
helm.sh/chart: {{ include "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.chart" . }}
{{ include "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9cf92bd0-c618-4c94-8a42-43160ec9badb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}