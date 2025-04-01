
{{- define "go-echo217502e0-6a52-4174-8482-702fa0014cac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo217502e0-6a52-4174-8482-702fa0014cac.fullname" -}}
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


{{- define "go-echo217502e0-6a52-4174-8482-702fa0014cac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo217502e0-6a52-4174-8482-702fa0014cac.labels" -}}
helm.sh/chart: {{ include "go-echo217502e0-6a52-4174-8482-702fa0014cac.chart" . }}
{{ include "go-echo217502e0-6a52-4174-8482-702fa0014cac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo217502e0-6a52-4174-8482-702fa0014cac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo217502e0-6a52-4174-8482-702fa0014cac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}