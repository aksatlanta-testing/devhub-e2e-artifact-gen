
{{- define "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.fullname" -}}
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


{{- define "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.labels" -}}
helm.sh/chart: {{ include "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.chart" . }}
{{ include "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc75754a-3f85-4ed1-a923-dd67611ad71b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}