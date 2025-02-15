
{{- define "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.fullname" -}}
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


{{- define "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.labels" -}}
helm.sh/chart: {{ include "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.chart" . }}
{{ include "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2f3550e6-4040-4a0f-a088-e57ad5bfb5cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}