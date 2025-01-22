
{{- define "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.fullname" -}}
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


{{- define "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.labels" -}}
helm.sh/chart: {{ include "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.chart" . }}
{{ include "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe2e7bfd-ee02-4c06-b182-1e3cc46d6d46.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}