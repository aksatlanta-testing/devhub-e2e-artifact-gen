
{{- define "go-echoeebb01a7-041f-4077-8b75-a531b2993221.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebb01a7-041f-4077-8b75-a531b2993221.fullname" -}}
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


{{- define "go-echoeebb01a7-041f-4077-8b75-a531b2993221.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebb01a7-041f-4077-8b75-a531b2993221.labels" -}}
helm.sh/chart: {{ include "go-echoeebb01a7-041f-4077-8b75-a531b2993221.chart" . }}
{{ include "go-echoeebb01a7-041f-4077-8b75-a531b2993221.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeebb01a7-041f-4077-8b75-a531b2993221.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeebb01a7-041f-4077-8b75-a531b2993221.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}