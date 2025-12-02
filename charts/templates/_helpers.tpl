
{{- define "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.fullname" -}}
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


{{- define "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.labels" -}}
helm.sh/chart: {{ include "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.chart" . }}
{{ include "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4bc84e85-d893-4e49-b48d-2cf7bfe4dcae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}