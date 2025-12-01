
{{- define "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.fullname" -}}
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


{{- define "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.labels" -}}
helm.sh/chart: {{ include "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.chart" . }}
{{ include "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoef1fb6b0-ab36-4aab-9a32-ec8b7f36b301.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}