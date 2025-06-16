
{{- define "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.fullname" -}}
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


{{- define "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.labels" -}}
helm.sh/chart: {{ include "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.chart" . }}
{{ include "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfab08d8-70e5-44d7-8237-176e59e0b5cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}