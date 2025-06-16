
{{- define "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.fullname" -}}
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


{{- define "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.labels" -}}
helm.sh/chart: {{ include "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.chart" . }}
{{ include "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d4a570b-1d8f-46c9-a79f-c58bf372faf8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}