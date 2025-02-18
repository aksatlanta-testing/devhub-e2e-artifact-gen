
{{- define "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.fullname" -}}
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


{{- define "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.labels" -}}
helm.sh/chart: {{ include "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.chart" . }}
{{ include "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabc4283f-1b11-4051-aa36-4bcc92c41af7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}