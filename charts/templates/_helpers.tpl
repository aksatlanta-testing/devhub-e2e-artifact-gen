
{{- define "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.fullname" -}}
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


{{- define "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.labels" -}}
helm.sh/chart: {{ include "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.chart" . }}
{{ include "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe0ae2fd-72c2-4788-b16f-1c34660d4d94.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}