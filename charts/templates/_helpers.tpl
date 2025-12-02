
{{- define "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.fullname" -}}
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


{{- define "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.labels" -}}
helm.sh/chart: {{ include "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.chart" . }}
{{ include "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo89c9627a-b7e4-4b6d-9b20-54b282c0ab18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}