
{{- define "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.fullname" -}}
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


{{- define "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.labels" -}}
helm.sh/chart: {{ include "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.chart" . }}
{{ include "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31ffdaed-3f5b-4d28-a42d-09c9c5f15909.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}