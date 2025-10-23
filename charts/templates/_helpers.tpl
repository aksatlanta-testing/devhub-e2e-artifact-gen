
{{- define "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.fullname" -}}
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


{{- define "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.labels" -}}
helm.sh/chart: {{ include "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.chart" . }}
{{ include "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8cd06f35-b12d-41bb-80d7-6134eb7ecf26.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}