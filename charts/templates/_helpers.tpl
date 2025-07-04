
{{- define "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.fullname" -}}
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


{{- define "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.labels" -}}
helm.sh/chart: {{ include "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.chart" . }}
{{ include "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf6cc3ff-9359-4513-b3c3-c57c03f01afd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}