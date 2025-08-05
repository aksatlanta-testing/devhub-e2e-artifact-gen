
{{- define "go-echo62b109f0-5566-4e81-a092-5efca71354ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62b109f0-5566-4e81-a092-5efca71354ba.fullname" -}}
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


{{- define "go-echo62b109f0-5566-4e81-a092-5efca71354ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62b109f0-5566-4e81-a092-5efca71354ba.labels" -}}
helm.sh/chart: {{ include "go-echo62b109f0-5566-4e81-a092-5efca71354ba.chart" . }}
{{ include "go-echo62b109f0-5566-4e81-a092-5efca71354ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62b109f0-5566-4e81-a092-5efca71354ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62b109f0-5566-4e81-a092-5efca71354ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}