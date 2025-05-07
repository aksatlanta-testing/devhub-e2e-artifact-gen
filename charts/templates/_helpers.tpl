
{{- define "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.fullname" -}}
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


{{- define "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.labels" -}}
helm.sh/chart: {{ include "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.chart" . }}
{{ include "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo58b53913-f67f-4d84-b0dc-6a997e3f1b5c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}