
{{- define "go-echobad34c26-299f-4559-afc7-80c69bccb42a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobad34c26-299f-4559-afc7-80c69bccb42a.fullname" -}}
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


{{- define "go-echobad34c26-299f-4559-afc7-80c69bccb42a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobad34c26-299f-4559-afc7-80c69bccb42a.labels" -}}
helm.sh/chart: {{ include "go-echobad34c26-299f-4559-afc7-80c69bccb42a.chart" . }}
{{ include "go-echobad34c26-299f-4559-afc7-80c69bccb42a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobad34c26-299f-4559-afc7-80c69bccb42a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobad34c26-299f-4559-afc7-80c69bccb42a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}