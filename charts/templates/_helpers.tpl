
{{- define "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.fullname" -}}
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


{{- define "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.labels" -}}
helm.sh/chart: {{ include "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.chart" . }}
{{ include "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof203cfa8-b25e-4e1f-a9dc-5229eb35ea83.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}