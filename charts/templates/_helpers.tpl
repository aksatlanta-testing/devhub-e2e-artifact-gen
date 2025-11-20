
{{- define "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.fullname" -}}
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


{{- define "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.labels" -}}
helm.sh/chart: {{ include "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.chart" . }}
{{ include "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9a7d275-58d3-4f93-9a20-5bb543b0e6bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}