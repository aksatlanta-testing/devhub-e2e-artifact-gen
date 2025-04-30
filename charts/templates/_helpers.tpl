
{{- define "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.fullname" -}}
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


{{- define "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.labels" -}}
helm.sh/chart: {{ include "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.chart" . }}
{{ include "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo63763c7f-c643-4aa8-8734-4efa2d81e8cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}