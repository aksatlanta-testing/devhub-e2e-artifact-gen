
{{- define "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.fullname" -}}
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


{{- define "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.labels" -}}
helm.sh/chart: {{ include "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.chart" . }}
{{ include "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee93be4c-7bbe-4767-a068-4af58ab45688.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}