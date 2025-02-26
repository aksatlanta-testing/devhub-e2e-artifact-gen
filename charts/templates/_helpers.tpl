
{{- define "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.fullname" -}}
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


{{- define "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.labels" -}}
helm.sh/chart: {{ include "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.chart" . }}
{{ include "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd7c4cda-66f5-4429-a9c9-f9cb1be5977a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}