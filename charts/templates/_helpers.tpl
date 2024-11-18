
{{- define "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.fullname" -}}
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


{{- define "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.labels" -}}
helm.sh/chart: {{ include "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.chart" . }}
{{ include "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa67a55c8-a3c8-46df-b6e5-32351ca5d040.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}