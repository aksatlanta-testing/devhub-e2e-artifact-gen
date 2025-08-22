
{{- define "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.fullname" -}}
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


{{- define "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.labels" -}}
helm.sh/chart: {{ include "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.chart" . }}
{{ include "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6f8b5f0c-36ee-49cc-ada7-ca6c09f9b755.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}