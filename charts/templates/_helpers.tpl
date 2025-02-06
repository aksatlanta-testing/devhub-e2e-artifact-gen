
{{- define "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.fullname" -}}
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


{{- define "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.labels" -}}
helm.sh/chart: {{ include "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.chart" . }}
{{ include "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8b6c9283-1e2f-4759-b027-0e2c82b14cdd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}