
{{- define "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.fullname" -}}
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


{{- define "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.labels" -}}
helm.sh/chart: {{ include "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.chart" . }}
{{ include "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe719bcc0-a578-4bd5-9e8c-b7c2725134fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}