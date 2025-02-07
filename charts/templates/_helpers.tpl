
{{- define "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.fullname" -}}
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


{{- define "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.labels" -}}
helm.sh/chart: {{ include "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.chart" . }}
{{ include "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc85a88d-564f-4fdf-8efb-ae4501e6dd51.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}