
{{- define "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.fullname" -}}
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


{{- define "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.labels" -}}
helm.sh/chart: {{ include "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.chart" . }}
{{ include "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa719b160-41f4-42a0-bcc6-45bfdd05254c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}