
{{- define "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.fullname" -}}
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


{{- define "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.labels" -}}
helm.sh/chart: {{ include "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.chart" . }}
{{ include "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18fbe2b8-d57d-4711-a1d0-5b52e629195c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}