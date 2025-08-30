
{{- define "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.fullname" -}}
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


{{- define "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.labels" -}}
helm.sh/chart: {{ include "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.chart" . }}
{{ include "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof76337ae-2be4-4f4c-9481-d89ac99a2836.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}