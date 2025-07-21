
{{- define "go-echof6d20921-1e80-43a6-a382-074e8813acfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6d20921-1e80-43a6-a382-074e8813acfb.fullname" -}}
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


{{- define "go-echof6d20921-1e80-43a6-a382-074e8813acfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6d20921-1e80-43a6-a382-074e8813acfb.labels" -}}
helm.sh/chart: {{ include "go-echof6d20921-1e80-43a6-a382-074e8813acfb.chart" . }}
{{ include "go-echof6d20921-1e80-43a6-a382-074e8813acfb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6d20921-1e80-43a6-a382-074e8813acfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6d20921-1e80-43a6-a382-074e8813acfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}