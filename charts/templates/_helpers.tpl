
{{- define "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.fullname" -}}
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


{{- define "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.labels" -}}
helm.sh/chart: {{ include "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.chart" . }}
{{ include "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo763b73c6-6c1e-41cb-9e3c-e8eaea0a3b6a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}