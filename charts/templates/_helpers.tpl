
{{- define "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.fullname" -}}
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


{{- define "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.labels" -}}
helm.sh/chart: {{ include "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.chart" . }}
{{ include "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c7d4b22-b8e3-4673-9548-8b87d22ea51a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}