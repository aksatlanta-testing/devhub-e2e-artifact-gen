
{{- define "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.fullname" -}}
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


{{- define "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.labels" -}}
helm.sh/chart: {{ include "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.chart" . }}
{{ include "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4647dc4b-ca8f-42cf-9b61-50a07b8c1b0a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}