
{{- define "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.fullname" -}}
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


{{- define "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.labels" -}}
helm.sh/chart: {{ include "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.chart" . }}
{{ include "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8ae7e42-39a6-4de5-8b09-4892be211a68.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}