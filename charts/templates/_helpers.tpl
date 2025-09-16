
{{- define "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.fullname" -}}
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


{{- define "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.labels" -}}
helm.sh/chart: {{ include "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.chart" . }}
{{ include "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2305803f-1a6d-4b94-8132-be88f9d7c114.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}