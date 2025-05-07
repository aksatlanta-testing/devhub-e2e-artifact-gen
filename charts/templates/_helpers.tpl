
{{- define "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.fullname" -}}
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


{{- define "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.labels" -}}
helm.sh/chart: {{ include "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.chart" . }}
{{ include "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo033b3aa0-d3c3-4e9b-b297-cc0fa1e2bccf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}