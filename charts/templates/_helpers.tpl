
{{- define "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.fullname" -}}
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


{{- define "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.labels" -}}
helm.sh/chart: {{ include "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.chart" . }}
{{ include "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaceafe90-449e-46ec-9faf-75a2f8cabe91.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}