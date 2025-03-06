
{{- define "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.fullname" -}}
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


{{- define "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.labels" -}}
helm.sh/chart: {{ include "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.chart" . }}
{{ include "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocef1f671-e23c-452c-9ea9-7d163a2ee52f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}