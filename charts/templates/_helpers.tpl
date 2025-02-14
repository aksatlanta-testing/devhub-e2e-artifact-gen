
{{- define "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.fullname" -}}
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


{{- define "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.labels" -}}
helm.sh/chart: {{ include "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.chart" . }}
{{ include "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2bad9cb0-cdc2-4e43-b97d-b8044a1d8d38.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}