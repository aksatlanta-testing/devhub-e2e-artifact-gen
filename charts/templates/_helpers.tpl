
{{- define "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.fullname" -}}
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


{{- define "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.labels" -}}
helm.sh/chart: {{ include "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.chart" . }}
{{ include "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo21484b80-eac4-4840-a4c0-03c46be858c5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}