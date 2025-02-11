
{{- define "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.fullname" -}}
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


{{- define "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.labels" -}}
helm.sh/chart: {{ include "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.chart" . }}
{{ include "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5d8c692-440a-4d1f-8ed3-fe9b6274244a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}