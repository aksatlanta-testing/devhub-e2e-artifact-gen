
{{- define "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.fullname" -}}
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


{{- define "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.labels" -}}
helm.sh/chart: {{ include "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.chart" . }}
{{ include "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5fc7baf1-b9a9-42c0-8f8f-2ef7f6398dc0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}