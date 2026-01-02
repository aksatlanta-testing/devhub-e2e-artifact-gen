
{{- define "go-echo71887b53-8cd6-4006-817c-c58035181cbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71887b53-8cd6-4006-817c-c58035181cbb.fullname" -}}
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


{{- define "go-echo71887b53-8cd6-4006-817c-c58035181cbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71887b53-8cd6-4006-817c-c58035181cbb.labels" -}}
helm.sh/chart: {{ include "go-echo71887b53-8cd6-4006-817c-c58035181cbb.chart" . }}
{{ include "go-echo71887b53-8cd6-4006-817c-c58035181cbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71887b53-8cd6-4006-817c-c58035181cbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71887b53-8cd6-4006-817c-c58035181cbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}