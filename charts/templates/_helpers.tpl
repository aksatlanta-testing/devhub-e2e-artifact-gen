
{{- define "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.fullname" -}}
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


{{- define "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.labels" -}}
helm.sh/chart: {{ include "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.chart" . }}
{{ include "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo58e030d2-6f25-4cf9-94db-edd4373e463f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}