
{{- define "go-echo38fb983c-9239-4673-bede-5fb225b5aace.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38fb983c-9239-4673-bede-5fb225b5aace.fullname" -}}
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


{{- define "go-echo38fb983c-9239-4673-bede-5fb225b5aace.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38fb983c-9239-4673-bede-5fb225b5aace.labels" -}}
helm.sh/chart: {{ include "go-echo38fb983c-9239-4673-bede-5fb225b5aace.chart" . }}
{{ include "go-echo38fb983c-9239-4673-bede-5fb225b5aace.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo38fb983c-9239-4673-bede-5fb225b5aace.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo38fb983c-9239-4673-bede-5fb225b5aace.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}