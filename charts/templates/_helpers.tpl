
{{- define "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.fullname" -}}
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


{{- define "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.labels" -}}
helm.sh/chart: {{ include "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.chart" . }}
{{ include "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c0d0ec0-36f4-436a-a549-c4890c60dafa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}