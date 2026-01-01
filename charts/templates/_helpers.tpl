
{{- define "go-echod560339c-6640-40e1-ba93-80d5e72d1836.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod560339c-6640-40e1-ba93-80d5e72d1836.fullname" -}}
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


{{- define "go-echod560339c-6640-40e1-ba93-80d5e72d1836.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod560339c-6640-40e1-ba93-80d5e72d1836.labels" -}}
helm.sh/chart: {{ include "go-echod560339c-6640-40e1-ba93-80d5e72d1836.chart" . }}
{{ include "go-echod560339c-6640-40e1-ba93-80d5e72d1836.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod560339c-6640-40e1-ba93-80d5e72d1836.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod560339c-6640-40e1-ba93-80d5e72d1836.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}