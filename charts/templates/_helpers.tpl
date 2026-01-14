
{{- define "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.fullname" -}}
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


{{- define "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.labels" -}}
helm.sh/chart: {{ include "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.chart" . }}
{{ include "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff263475-0fd6-4b3b-ba98-3af6dec266ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}