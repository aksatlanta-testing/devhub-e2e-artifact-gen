
{{- define "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.fullname" -}}
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


{{- define "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.labels" -}}
helm.sh/chart: {{ include "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.chart" . }}
{{ include "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15b35a15-5046-4ece-bb67-bb4f095d00ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}