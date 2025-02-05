
{{- define "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.fullname" -}}
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


{{- define "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.labels" -}}
helm.sh/chart: {{ include "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.chart" . }}
{{ include "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba4f5f57-f879-4f6f-9e7c-e9d14d658b8d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}