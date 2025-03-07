
{{- define "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.fullname" -}}
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


{{- define "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.labels" -}}
helm.sh/chart: {{ include "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.chart" . }}
{{ include "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo88d9b7e6-1007-4816-84f2-4a6b4232a9ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}