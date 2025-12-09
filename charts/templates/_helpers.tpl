
{{- define "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.fullname" -}}
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


{{- define "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.labels" -}}
helm.sh/chart: {{ include "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.chart" . }}
{{ include "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo758e6e39-2f63-41fe-a773-83a0f1015a8c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}