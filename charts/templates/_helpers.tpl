
{{- define "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.fullname" -}}
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


{{- define "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.labels" -}}
helm.sh/chart: {{ include "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.chart" . }}
{{ include "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0d95cc7d-65b3-483f-9de7-bcc5d7be7abf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}