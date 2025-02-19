
{{- define "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.fullname" -}}
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


{{- define "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.labels" -}}
helm.sh/chart: {{ include "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.chart" . }}
{{ include "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7f24ae7-76e0-4c92-a6da-f6ba5a976734.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}