
{{- define "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.fullname" -}}
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


{{- define "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.labels" -}}
helm.sh/chart: {{ include "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.chart" . }}
{{ include "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo73cfa7ac-716a-42c6-a186-1c10cc08ddbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}