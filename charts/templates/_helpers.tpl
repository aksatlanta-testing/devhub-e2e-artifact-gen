
{{- define "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.fullname" -}}
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


{{- define "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.labels" -}}
helm.sh/chart: {{ include "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.chart" . }}
{{ include "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b52b1b8-2fda-4a49-b7e0-6601b0e86a64.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}