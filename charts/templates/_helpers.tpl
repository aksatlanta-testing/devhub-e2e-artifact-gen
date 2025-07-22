
{{- define "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.fullname" -}}
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


{{- define "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.labels" -}}
helm.sh/chart: {{ include "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.chart" . }}
{{ include "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5c26848-c032-4f5b-8125-739cc5983bfd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}