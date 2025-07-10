
{{- define "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.fullname" -}}
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


{{- define "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.labels" -}}
helm.sh/chart: {{ include "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.chart" . }}
{{ include "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe576c0d4-ffe6-4237-bde7-15f6d4e75c5d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}