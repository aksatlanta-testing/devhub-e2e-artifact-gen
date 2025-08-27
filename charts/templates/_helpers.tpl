
{{- define "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.fullname" -}}
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


{{- define "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.labels" -}}
helm.sh/chart: {{ include "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.chart" . }}
{{ include "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo66646d34-8d98-4f75-96c8-fd90ab9c68bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}