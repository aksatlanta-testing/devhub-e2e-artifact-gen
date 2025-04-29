
{{- define "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.fullname" -}}
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


{{- define "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.labels" -}}
helm.sh/chart: {{ include "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.chart" . }}
{{ include "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4d049bd4-e9f2-4f33-a0ae-7b70ff1a814e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}