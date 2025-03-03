
{{- define "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.fullname" -}}
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


{{- define "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.labels" -}}
helm.sh/chart: {{ include "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.chart" . }}
{{ include "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1b212d8-1d65-4c75-a07e-1dfc8b4793bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}