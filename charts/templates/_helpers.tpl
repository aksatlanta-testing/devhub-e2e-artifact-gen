
{{- define "go-echo7d29c145-e81a-45e6-af92-db274583f64c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d29c145-e81a-45e6-af92-db274583f64c.fullname" -}}
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


{{- define "go-echo7d29c145-e81a-45e6-af92-db274583f64c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d29c145-e81a-45e6-af92-db274583f64c.labels" -}}
helm.sh/chart: {{ include "go-echo7d29c145-e81a-45e6-af92-db274583f64c.chart" . }}
{{ include "go-echo7d29c145-e81a-45e6-af92-db274583f64c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7d29c145-e81a-45e6-af92-db274583f64c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7d29c145-e81a-45e6-af92-db274583f64c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}