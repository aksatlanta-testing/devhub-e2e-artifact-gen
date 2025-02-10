
{{- define "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.fullname" -}}
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


{{- define "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.labels" -}}
helm.sh/chart: {{ include "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.chart" . }}
{{ include "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae820dc0-50c0-4745-9bbf-1f4b7ced6c35.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}