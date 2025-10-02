
{{- define "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.fullname" -}}
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


{{- define "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.labels" -}}
helm.sh/chart: {{ include "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.chart" . }}
{{ include "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae17c4c0-970c-4346-9cf6-4c21c71063a1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}