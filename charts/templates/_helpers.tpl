
{{- define "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.fullname" -}}
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


{{- define "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.labels" -}}
helm.sh/chart: {{ include "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.chart" . }}
{{ include "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed6b4142-0882-460a-aa8b-7c314ecfe51b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}