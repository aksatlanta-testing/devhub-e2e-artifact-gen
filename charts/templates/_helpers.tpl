
{{- define "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.fullname" -}}
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


{{- define "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.labels" -}}
helm.sh/chart: {{ include "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.chart" . }}
{{ include "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo515a24b0-5749-4e81-8a3b-5b6170c05759.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}