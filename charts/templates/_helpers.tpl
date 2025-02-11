
{{- define "go-echof610625b-7e68-475b-8334-f9164ce1581b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof610625b-7e68-475b-8334-f9164ce1581b.fullname" -}}
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


{{- define "go-echof610625b-7e68-475b-8334-f9164ce1581b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof610625b-7e68-475b-8334-f9164ce1581b.labels" -}}
helm.sh/chart: {{ include "go-echof610625b-7e68-475b-8334-f9164ce1581b.chart" . }}
{{ include "go-echof610625b-7e68-475b-8334-f9164ce1581b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof610625b-7e68-475b-8334-f9164ce1581b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof610625b-7e68-475b-8334-f9164ce1581b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}