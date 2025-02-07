
{{- define "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.fullname" -}}
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


{{- define "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.labels" -}}
helm.sh/chart: {{ include "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.chart" . }}
{{ include "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo60a6bdfb-a005-42f5-999d-610b8202656b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}