
{{- define "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.fullname" -}}
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


{{- define "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.labels" -}}
helm.sh/chart: {{ include "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.chart" . }}
{{ include "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a2912a8-7367-4198-9725-e8ca07c5cf4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}