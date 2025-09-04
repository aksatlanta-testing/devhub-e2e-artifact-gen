
{{- define "go-echoed2a07f8-3964-4389-9291-187a606c95dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed2a07f8-3964-4389-9291-187a606c95dd.fullname" -}}
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


{{- define "go-echoed2a07f8-3964-4389-9291-187a606c95dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed2a07f8-3964-4389-9291-187a606c95dd.labels" -}}
helm.sh/chart: {{ include "go-echoed2a07f8-3964-4389-9291-187a606c95dd.chart" . }}
{{ include "go-echoed2a07f8-3964-4389-9291-187a606c95dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed2a07f8-3964-4389-9291-187a606c95dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed2a07f8-3964-4389-9291-187a606c95dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}