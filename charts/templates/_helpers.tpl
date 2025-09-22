
{{- define "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.fullname" -}}
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


{{- define "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.labels" -}}
helm.sh/chart: {{ include "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.chart" . }}
{{ include "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9aec9014-09f1-42c3-8e64-819dab3ceacc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}