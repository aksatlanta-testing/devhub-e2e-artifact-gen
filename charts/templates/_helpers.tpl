
{{- define "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.fullname" -}}
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


{{- define "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.labels" -}}
helm.sh/chart: {{ include "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.chart" . }}
{{ include "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb469a86-bcab-47d3-b37f-fbe4df901f00.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}