
{{- define "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.fullname" -}}
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


{{- define "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.labels" -}}
helm.sh/chart: {{ include "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.chart" . }}
{{ include "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo20aacdc2-f8e9-4dc4-b592-b912bba09867.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}