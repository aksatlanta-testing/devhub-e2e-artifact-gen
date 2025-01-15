
{{- define "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.fullname" -}}
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


{{- define "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.labels" -}}
helm.sh/chart: {{ include "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.chart" . }}
{{ include "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab0eb030-61d8-4d92-b28d-90b5ddf6b060.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}