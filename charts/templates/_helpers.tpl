
{{- define "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.fullname" -}}
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


{{- define "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.labels" -}}
helm.sh/chart: {{ include "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.chart" . }}
{{ include "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb1eed54-5f7f-44c0-8b4a-ca38333b935e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}