
{{- define "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.fullname" -}}
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


{{- define "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.labels" -}}
helm.sh/chart: {{ include "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.chart" . }}
{{ include "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f1be6e4-b480-44f6-8da7-23cb6b345716.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}