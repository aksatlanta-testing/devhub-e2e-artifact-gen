
{{- define "go-echod8f0079f-b150-4902-bae9-94b2333a7171.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8f0079f-b150-4902-bae9-94b2333a7171.fullname" -}}
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


{{- define "go-echod8f0079f-b150-4902-bae9-94b2333a7171.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8f0079f-b150-4902-bae9-94b2333a7171.labels" -}}
helm.sh/chart: {{ include "go-echod8f0079f-b150-4902-bae9-94b2333a7171.chart" . }}
{{ include "go-echod8f0079f-b150-4902-bae9-94b2333a7171.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8f0079f-b150-4902-bae9-94b2333a7171.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8f0079f-b150-4902-bae9-94b2333a7171.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}