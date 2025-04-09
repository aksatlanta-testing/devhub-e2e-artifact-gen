
{{- define "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.fullname" -}}
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


{{- define "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.labels" -}}
helm.sh/chart: {{ include "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.chart" . }}
{{ include "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69436d14-e0b7-486a-b41e-53551a19cedb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}