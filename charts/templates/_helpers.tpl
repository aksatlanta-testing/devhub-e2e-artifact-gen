
{{- define "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.fullname" -}}
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


{{- define "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.labels" -}}
helm.sh/chart: {{ include "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.chart" . }}
{{ include "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a8103c0-4919-4640-aabc-4322c3e7cdff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}