
{{- define "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.fullname" -}}
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


{{- define "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.labels" -}}
helm.sh/chart: {{ include "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.chart" . }}
{{ include "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo581cf8d8-e673-467d-9677-8848e5b8758c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}