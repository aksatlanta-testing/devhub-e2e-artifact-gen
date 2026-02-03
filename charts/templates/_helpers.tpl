
{{- define "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.fullname" -}}
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


{{- define "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.labels" -}}
helm.sh/chart: {{ include "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.chart" . }}
{{ include "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf0cdf4a-e4ca-449d-8789-50be3190957e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}