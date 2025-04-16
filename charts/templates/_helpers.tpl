
{{- define "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.fullname" -}}
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


{{- define "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.labels" -}}
helm.sh/chart: {{ include "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.chart" . }}
{{ include "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1b1d98c6-e11d-47ea-acf3-04c9fa37767a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}