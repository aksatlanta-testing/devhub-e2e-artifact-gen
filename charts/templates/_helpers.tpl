
{{- define "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.fullname" -}}
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


{{- define "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.labels" -}}
helm.sh/chart: {{ include "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.chart" . }}
{{ include "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d1c9df0-6d40-4116-8d22-f889168ea3fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}