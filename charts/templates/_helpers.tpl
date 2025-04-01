
{{- define "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.fullname" -}}
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


{{- define "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.labels" -}}
helm.sh/chart: {{ include "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.chart" . }}
{{ include "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo43b8c119-17c9-4955-a9d4-3a5f1d3b373e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}