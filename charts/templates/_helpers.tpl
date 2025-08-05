
{{- define "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.fullname" -}}
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


{{- define "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.labels" -}}
helm.sh/chart: {{ include "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.chart" . }}
{{ include "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo51b1b80f-1fb5-4e8e-b0ad-e8c84e54a5f8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}