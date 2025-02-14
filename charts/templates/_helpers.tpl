
{{- define "go-echo3cd25641-897d-4705-87c9-cc76294d3953.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3cd25641-897d-4705-87c9-cc76294d3953.fullname" -}}
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


{{- define "go-echo3cd25641-897d-4705-87c9-cc76294d3953.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3cd25641-897d-4705-87c9-cc76294d3953.labels" -}}
helm.sh/chart: {{ include "go-echo3cd25641-897d-4705-87c9-cc76294d3953.chart" . }}
{{ include "go-echo3cd25641-897d-4705-87c9-cc76294d3953.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3cd25641-897d-4705-87c9-cc76294d3953.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3cd25641-897d-4705-87c9-cc76294d3953.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}