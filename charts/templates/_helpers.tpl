
{{- define "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.fullname" -}}
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


{{- define "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.labels" -}}
helm.sh/chart: {{ include "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.chart" . }}
{{ include "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc975b5c5-0c3a-4b33-b1e2-edc83653f73c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}