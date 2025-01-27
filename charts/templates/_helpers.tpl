
{{- define "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.fullname" -}}
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


{{- define "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.labels" -}}
helm.sh/chart: {{ include "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.chart" . }}
{{ include "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad36ac7d-ed20-4704-8c83-f5cb5487d49a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}