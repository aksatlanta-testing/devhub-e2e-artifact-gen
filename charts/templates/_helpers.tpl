
{{- define "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.fullname" -}}
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


{{- define "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.labels" -}}
helm.sh/chart: {{ include "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.chart" . }}
{{ include "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacfc9a61-8703-403d-aad1-551fb66e9060.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}