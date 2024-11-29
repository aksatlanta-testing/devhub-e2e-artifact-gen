
{{- define "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.fullname" -}}
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


{{- define "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.labels" -}}
helm.sh/chart: {{ include "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.chart" . }}
{{ include "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa76cd26-d8f7-4162-8fad-7f9356d2e457.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}