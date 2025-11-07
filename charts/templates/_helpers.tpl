
{{- define "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.fullname" -}}
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


{{- define "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.labels" -}}
helm.sh/chart: {{ include "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.chart" . }}
{{ include "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6f0a2ef5-bab8-4232-baca-99d85f7b9749.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}