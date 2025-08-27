
{{- define "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.fullname" -}}
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


{{- define "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.labels" -}}
helm.sh/chart: {{ include "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.chart" . }}
{{ include "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof7e43729-0d3e-41c5-af7f-aac9b0734a76.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}