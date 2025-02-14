
{{- define "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.fullname" -}}
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


{{- define "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.labels" -}}
helm.sh/chart: {{ include "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.chart" . }}
{{ include "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo13849e5c-0efc-4c62-b398-8016e24ba19a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}