
{{- define "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.fullname" -}}
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


{{- define "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.labels" -}}
helm.sh/chart: {{ include "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.chart" . }}
{{ include "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabeefe2c-c8d8-4079-b8a6-b934b6889f4d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}