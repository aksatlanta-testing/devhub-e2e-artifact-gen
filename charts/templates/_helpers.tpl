
{{- define "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.fullname" -}}
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


{{- define "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.labels" -}}
helm.sh/chart: {{ include "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.chart" . }}
{{ include "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc34c164-4421-4cdf-8635-a10abb3f41c0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}