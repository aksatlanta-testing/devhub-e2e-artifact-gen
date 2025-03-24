
{{- define "go-echofc91d88d-ae5d-40bb-8727-80208549307a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc91d88d-ae5d-40bb-8727-80208549307a.fullname" -}}
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


{{- define "go-echofc91d88d-ae5d-40bb-8727-80208549307a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc91d88d-ae5d-40bb-8727-80208549307a.labels" -}}
helm.sh/chart: {{ include "go-echofc91d88d-ae5d-40bb-8727-80208549307a.chart" . }}
{{ include "go-echofc91d88d-ae5d-40bb-8727-80208549307a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc91d88d-ae5d-40bb-8727-80208549307a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc91d88d-ae5d-40bb-8727-80208549307a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}