
{{- define "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.fullname" -}}
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


{{- define "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.labels" -}}
helm.sh/chart: {{ include "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.chart" . }}
{{ include "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3741b36f-5d88-4a60-8763-faa6c22b588e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}