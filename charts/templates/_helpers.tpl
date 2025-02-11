
{{- define "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.fullname" -}}
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


{{- define "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.labels" -}}
helm.sh/chart: {{ include "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.chart" . }}
{{ include "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda6e8ea3-75f1-47e4-a015-64a00d6c55a9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}