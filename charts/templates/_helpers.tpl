
{{- define "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.fullname" -}}
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


{{- define "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.labels" -}}
helm.sh/chart: {{ include "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.chart" . }}
{{ include "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo70a73b64-9ec3-480a-bcb5-c7e558980019.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}