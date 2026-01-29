
{{- define "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.fullname" -}}
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


{{- define "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.labels" -}}
helm.sh/chart: {{ include "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.chart" . }}
{{ include "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec4ffd7b-e6de-4c08-929f-cf7211bf2afe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}