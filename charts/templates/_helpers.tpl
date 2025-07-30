
{{- define "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.fullname" -}}
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


{{- define "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.labels" -}}
helm.sh/chart: {{ include "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.chart" . }}
{{ include "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1b7269ad-1cf3-47b5-9299-0d9d3c7219ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}