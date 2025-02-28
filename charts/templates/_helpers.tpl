
{{- define "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.fullname" -}}
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


{{- define "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.labels" -}}
helm.sh/chart: {{ include "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.chart" . }}
{{ include "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf7af8f5-790f-4ed6-a9f9-11dc36fe9407.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}