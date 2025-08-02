
{{- define "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.fullname" -}}
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


{{- define "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.labels" -}}
helm.sh/chart: {{ include "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.chart" . }}
{{ include "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo215725ab-3a56-4515-a3e0-2cf12d4ccfab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}