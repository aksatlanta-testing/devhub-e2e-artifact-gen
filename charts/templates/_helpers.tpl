
{{- define "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.fullname" -}}
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


{{- define "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.labels" -}}
helm.sh/chart: {{ include "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.chart" . }}
{{ include "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7e4747de-3082-4cd4-869d-43bbab4bcdb0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}