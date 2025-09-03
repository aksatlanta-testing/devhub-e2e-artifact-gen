
{{- define "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.fullname" -}}
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


{{- define "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.labels" -}}
helm.sh/chart: {{ include "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.chart" . }}
{{ include "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo719d6016-8b00-4677-b2e7-b7f6d15c47ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}