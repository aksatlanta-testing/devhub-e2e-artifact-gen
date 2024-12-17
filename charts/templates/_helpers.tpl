
{{- define "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.fullname" -}}
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


{{- define "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.labels" -}}
helm.sh/chart: {{ include "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.chart" . }}
{{ include "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefdb6a0d-3279-496c-8b18-33cf0423d771.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}