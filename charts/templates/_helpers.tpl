
{{- define "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.fullname" -}}
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


{{- define "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.labels" -}}
helm.sh/chart: {{ include "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.chart" . }}
{{ include "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo97b6a54a-8a55-48b8-95f2-1538bd655544.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}