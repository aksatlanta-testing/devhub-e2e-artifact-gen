
{{- define "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.fullname" -}}
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


{{- define "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.labels" -}}
helm.sh/chart: {{ include "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.chart" . }}
{{ include "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe86cde8-40c2-4bdc-9b62-f8b0b9817545.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}