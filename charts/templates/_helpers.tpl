
{{- define "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.fullname" -}}
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


{{- define "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.labels" -}}
helm.sh/chart: {{ include "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.chart" . }}
{{ include "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9b39b0da-0d8f-4f6b-80f0-216cfb5a1ebc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}