
{{- define "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.fullname" -}}
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


{{- define "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.labels" -}}
helm.sh/chart: {{ include "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.chart" . }}
{{ include "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1f5a48db-2193-413b-a01f-4152b4f23eeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}