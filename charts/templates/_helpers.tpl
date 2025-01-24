
{{- define "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.fullname" -}}
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


{{- define "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.labels" -}}
helm.sh/chart: {{ include "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.chart" . }}
{{ include "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8f41c23-5e70-42b3-aaeb-6fd7ec47da0c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}