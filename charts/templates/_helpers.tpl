
{{- define "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.fullname" -}}
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


{{- define "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.labels" -}}
helm.sh/chart: {{ include "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.chart" . }}
{{ include "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod6ba4961-93f2-4c60-8c1b-318acabf981e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}