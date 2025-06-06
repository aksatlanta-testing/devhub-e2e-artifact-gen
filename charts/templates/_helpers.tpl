
{{- define "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.fullname" -}}
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


{{- define "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.labels" -}}
helm.sh/chart: {{ include "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.chart" . }}
{{ include "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa47667c0-9b02-4a2e-87ae-7b2b8d32e338.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}