
{{- define "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.fullname" -}}
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


{{- define "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.labels" -}}
helm.sh/chart: {{ include "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.chart" . }}
{{ include "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5961732-6b36-480a-94c8-b01746b4e3b7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}