
{{- define "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.fullname" -}}
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


{{- define "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.labels" -}}
helm.sh/chart: {{ include "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.chart" . }}
{{ include "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2ddb0010-2f96-44e1-8502-efa661af8b62.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}