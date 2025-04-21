
{{- define "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.fullname" -}}
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


{{- define "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.labels" -}}
helm.sh/chart: {{ include "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.chart" . }}
{{ include "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe6b40bb3-a889-464a-a491-7bb026aca6ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}