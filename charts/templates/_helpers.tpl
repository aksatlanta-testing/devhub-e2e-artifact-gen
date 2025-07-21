
{{- define "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.fullname" -}}
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


{{- define "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.labels" -}}
helm.sh/chart: {{ include "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.chart" . }}
{{ include "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ea5d1df-2f31-4779-8ddf-77ea69e548ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}