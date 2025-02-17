
{{- define "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.fullname" -}}
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


{{- define "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.labels" -}}
helm.sh/chart: {{ include "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.chart" . }}
{{ include "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1ffcd0a-6ec7-4273-afce-61dbb8565dfd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}