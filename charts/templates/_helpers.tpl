
{{- define "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.fullname" -}}
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


{{- define "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.labels" -}}
helm.sh/chart: {{ include "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.chart" . }}
{{ include "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2abcc5ed-7991-4ea3-9041-3d5582a6d009.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}