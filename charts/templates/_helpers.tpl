
{{- define "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.fullname" -}}
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


{{- define "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.labels" -}}
helm.sh/chart: {{ include "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.chart" . }}
{{ include "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof68b6bab-6373-4671-806a-edb6bbbf53da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}