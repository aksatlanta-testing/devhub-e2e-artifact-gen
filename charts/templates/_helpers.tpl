
{{- define "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.fullname" -}}
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


{{- define "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.labels" -}}
helm.sh/chart: {{ include "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.chart" . }}
{{ include "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5aeb3190-fd2a-4dda-99da-87f68a8e04be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}