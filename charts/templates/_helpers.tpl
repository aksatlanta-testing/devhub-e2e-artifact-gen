
{{- define "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.fullname" -}}
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


{{- define "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.labels" -}}
helm.sh/chart: {{ include "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.chart" . }}
{{ include "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8e512d5-319f-4790-b0f1-1f7da5ee6697.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}