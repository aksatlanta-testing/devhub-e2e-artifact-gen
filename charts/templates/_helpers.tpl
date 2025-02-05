
{{- define "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.fullname" -}}
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


{{- define "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.labels" -}}
helm.sh/chart: {{ include "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.chart" . }}
{{ include "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc955802b-43d6-4d1f-9cda-81c14913cd3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}