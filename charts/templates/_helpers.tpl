
{{- define "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.fullname" -}}
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


{{- define "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.labels" -}}
helm.sh/chart: {{ include "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.chart" . }}
{{ include "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo89ea84c0-1980-4581-8035-b071d2aa5bca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}