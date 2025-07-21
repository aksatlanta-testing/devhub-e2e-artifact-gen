
{{- define "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.fullname" -}}
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


{{- define "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.labels" -}}
helm.sh/chart: {{ include "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.chart" . }}
{{ include "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4333b778-1cf7-4466-b5a2-5a290d1e7112.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}