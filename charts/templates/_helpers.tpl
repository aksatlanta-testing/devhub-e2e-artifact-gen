
{{- define "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.fullname" -}}
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


{{- define "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.labels" -}}
helm.sh/chart: {{ include "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.chart" . }}
{{ include "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62d1bc2c-2bc5-42c8-a3bc-975165d9c36b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}