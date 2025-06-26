
{{- define "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.fullname" -}}
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


{{- define "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.labels" -}}
helm.sh/chart: {{ include "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.chart" . }}
{{ include "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob736fd2a-cefe-4b5e-b6fa-5372dac5c2ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}