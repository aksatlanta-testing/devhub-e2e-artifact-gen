
{{- define "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.fullname" -}}
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


{{- define "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.labels" -}}
helm.sh/chart: {{ include "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.chart" . }}
{{ include "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefa7ecb8-7218-4f3c-b7d9-85561fa9b9e0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}