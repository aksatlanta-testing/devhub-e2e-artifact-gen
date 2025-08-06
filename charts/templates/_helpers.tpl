
{{- define "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.fullname" -}}
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


{{- define "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.labels" -}}
helm.sh/chart: {{ include "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.chart" . }}
{{ include "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6547d70a-f019-4f62-8553-9a9c3232bee6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}