
{{- define "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.fullname" -}}
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


{{- define "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.labels" -}}
helm.sh/chart: {{ include "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.chart" . }}
{{ include "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4818f0b4-eed0-4154-b89c-f7a4196a2fbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}