
{{- define "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.fullname" -}}
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


{{- define "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.labels" -}}
helm.sh/chart: {{ include "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.chart" . }}
{{ include "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacc59e72-f942-486a-984d-37ed1d1d603e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}