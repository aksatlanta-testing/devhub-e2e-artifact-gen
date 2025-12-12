
{{- define "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.fullname" -}}
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


{{- define "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.labels" -}}
helm.sh/chart: {{ include "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.chart" . }}
{{ include "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7974a782-e4e8-4cf0-b667-898c5697abea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}