
{{- define "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.fullname" -}}
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


{{- define "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.labels" -}}
helm.sh/chart: {{ include "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.chart" . }}
{{ include "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8bf2f436-88fb-4568-81cd-f77f0bced661.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}