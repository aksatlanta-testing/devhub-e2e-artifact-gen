
{{- define "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.fullname" -}}
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


{{- define "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.labels" -}}
helm.sh/chart: {{ include "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.chart" . }}
{{ include "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo803f53dd-6e52-4c60-b20d-4e1c059964ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}