
{{- define "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.fullname" -}}
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


{{- define "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.labels" -}}
helm.sh/chart: {{ include "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.chart" . }}
{{ include "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1e8dddf8-98b0-4c66-bc15-eb939ae90688.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}