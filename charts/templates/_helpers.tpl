
{{- define "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.fullname" -}}
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


{{- define "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.labels" -}}
helm.sh/chart: {{ include "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.chart" . }}
{{ include "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea8c1642-f13d-402a-897a-3fafc4c0e992.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}