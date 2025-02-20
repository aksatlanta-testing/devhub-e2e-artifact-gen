
{{- define "go-echoff540889-1856-4962-ab12-4e2275a5b945.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff540889-1856-4962-ab12-4e2275a5b945.fullname" -}}
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


{{- define "go-echoff540889-1856-4962-ab12-4e2275a5b945.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff540889-1856-4962-ab12-4e2275a5b945.labels" -}}
helm.sh/chart: {{ include "go-echoff540889-1856-4962-ab12-4e2275a5b945.chart" . }}
{{ include "go-echoff540889-1856-4962-ab12-4e2275a5b945.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff540889-1856-4962-ab12-4e2275a5b945.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff540889-1856-4962-ab12-4e2275a5b945.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}