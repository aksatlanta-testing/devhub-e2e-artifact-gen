
{{- define "go-echod7432e4a-789b-439d-8f16-67ad8f127711.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7432e4a-789b-439d-8f16-67ad8f127711.fullname" -}}
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


{{- define "go-echod7432e4a-789b-439d-8f16-67ad8f127711.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7432e4a-789b-439d-8f16-67ad8f127711.labels" -}}
helm.sh/chart: {{ include "go-echod7432e4a-789b-439d-8f16-67ad8f127711.chart" . }}
{{ include "go-echod7432e4a-789b-439d-8f16-67ad8f127711.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7432e4a-789b-439d-8f16-67ad8f127711.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7432e4a-789b-439d-8f16-67ad8f127711.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}