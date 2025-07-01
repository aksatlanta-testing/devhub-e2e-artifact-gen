
{{- define "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.fullname" -}}
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


{{- define "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.labels" -}}
helm.sh/chart: {{ include "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.chart" . }}
{{ include "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5dc9e6e6-8a25-4cf4-84a8-abf399a9cddc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}