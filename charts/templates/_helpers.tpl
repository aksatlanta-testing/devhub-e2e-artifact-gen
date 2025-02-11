
{{- define "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.fullname" -}}
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


{{- define "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.labels" -}}
helm.sh/chart: {{ include "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.chart" . }}
{{ include "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc487eb12-7acd-49fa-92fc-289f0d2f25cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}