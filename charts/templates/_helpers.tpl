
{{- define "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.fullname" -}}
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


{{- define "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.labels" -}}
helm.sh/chart: {{ include "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.chart" . }}
{{ include "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5c683a2-4cc5-406a-8fd4-a63ef683d6ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}