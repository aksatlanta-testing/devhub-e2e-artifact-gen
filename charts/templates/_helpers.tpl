
{{- define "go-echofbca1025-b592-4355-b56b-d17233384399.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbca1025-b592-4355-b56b-d17233384399.fullname" -}}
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


{{- define "go-echofbca1025-b592-4355-b56b-d17233384399.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbca1025-b592-4355-b56b-d17233384399.labels" -}}
helm.sh/chart: {{ include "go-echofbca1025-b592-4355-b56b-d17233384399.chart" . }}
{{ include "go-echofbca1025-b592-4355-b56b-d17233384399.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbca1025-b592-4355-b56b-d17233384399.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbca1025-b592-4355-b56b-d17233384399.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}