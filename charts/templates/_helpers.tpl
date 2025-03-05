
{{- define "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.fullname" -}}
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


{{- define "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.labels" -}}
helm.sh/chart: {{ include "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.chart" . }}
{{ include "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5038e5c8-9cc6-4d4a-ab27-14bfabe61bda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}