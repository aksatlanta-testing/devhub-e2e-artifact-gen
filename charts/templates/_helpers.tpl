
{{- define "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.fullname" -}}
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


{{- define "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.labels" -}}
helm.sh/chart: {{ include "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.chart" . }}
{{ include "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd7c36a5-e0e0-43dc-9cc6-960eb061062d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}