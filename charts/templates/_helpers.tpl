
{{- define "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.fullname" -}}
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


{{- define "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.labels" -}}
helm.sh/chart: {{ include "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.chart" . }}
{{ include "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9f52424-527c-49d9-9781-67eb75ead1da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}