
{{- define "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.fullname" -}}
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


{{- define "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.labels" -}}
helm.sh/chart: {{ include "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.chart" . }}
{{ include "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae551dbf-0ae8-4a6b-b291-6a3ab773998b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}