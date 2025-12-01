
{{- define "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.fullname" -}}
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


{{- define "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.labels" -}}
helm.sh/chart: {{ include "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.chart" . }}
{{ include "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob8363781-c5cf-4b78-9343-149e0a0571ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}