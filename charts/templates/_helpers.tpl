
{{- define "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.fullname" -}}
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


{{- define "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.labels" -}}
helm.sh/chart: {{ include "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.chart" . }}
{{ include "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof192af59-b8d6-4d84-868b-19eeabdf7ddf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}