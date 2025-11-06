
{{- define "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.fullname" -}}
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


{{- define "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.labels" -}}
helm.sh/chart: {{ include "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.chart" . }}
{{ include "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd9edfc1-cfe8-4b57-a75d-6008dc2f38f5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}