
{{- define "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.fullname" -}}
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


{{- define "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.labels" -}}
helm.sh/chart: {{ include "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.chart" . }}
{{ include "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf8c5bf2-23ab-4a40-a6f1-86e6c1577032.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}