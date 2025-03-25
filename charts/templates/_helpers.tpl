
{{- define "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.fullname" -}}
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


{{- define "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.labels" -}}
helm.sh/chart: {{ include "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.chart" . }}
{{ include "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo88b4071d-7797-4566-996d-e8ca7814b21c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}