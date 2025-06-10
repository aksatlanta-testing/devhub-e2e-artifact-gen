
{{- define "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.fullname" -}}
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


{{- define "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.labels" -}}
helm.sh/chart: {{ include "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.chart" . }}
{{ include "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo686c8aee-a511-4f87-a2f7-002c05c971aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}