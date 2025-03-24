
{{- define "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.fullname" -}}
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


{{- define "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.labels" -}}
helm.sh/chart: {{ include "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.chart" . }}
{{ include "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfa8b01c-0634-4bee-aaf3-4f5a2718b6ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}