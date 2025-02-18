
{{- define "go-echode525653-3141-4cad-8355-3165ba76a65b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode525653-3141-4cad-8355-3165ba76a65b.fullname" -}}
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


{{- define "go-echode525653-3141-4cad-8355-3165ba76a65b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode525653-3141-4cad-8355-3165ba76a65b.labels" -}}
helm.sh/chart: {{ include "go-echode525653-3141-4cad-8355-3165ba76a65b.chart" . }}
{{ include "go-echode525653-3141-4cad-8355-3165ba76a65b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode525653-3141-4cad-8355-3165ba76a65b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode525653-3141-4cad-8355-3165ba76a65b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}