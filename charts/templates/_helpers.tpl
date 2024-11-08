
{{- define "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.fullname" -}}
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


{{- define "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.labels" -}}
helm.sh/chart: {{ include "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.chart" . }}
{{ include "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo510734d5-6cef-4c67-9d9a-a02e51888114.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}