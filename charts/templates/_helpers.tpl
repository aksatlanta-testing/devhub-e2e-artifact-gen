
{{- define "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.fullname" -}}
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


{{- define "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.labels" -}}
helm.sh/chart: {{ include "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.chart" . }}
{{ include "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo563b941d-f86a-4d7d-ae8d-360b5f897352.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}