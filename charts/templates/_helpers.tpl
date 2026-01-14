
{{- define "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.fullname" -}}
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


{{- define "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.labels" -}}
helm.sh/chart: {{ include "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.chart" . }}
{{ include "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof63a42d3-ab7d-4f70-a152-0f028f0cb6eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}