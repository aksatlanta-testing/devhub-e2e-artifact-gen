
{{- define "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.fullname" -}}
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


{{- define "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.labels" -}}
helm.sh/chart: {{ include "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.chart" . }}
{{ include "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo445dd3d3-7b27-4d8b-a3d4-4319b7bf43ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}