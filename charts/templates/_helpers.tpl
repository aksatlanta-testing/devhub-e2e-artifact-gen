
{{- define "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.fullname" -}}
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


{{- define "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.labels" -}}
helm.sh/chart: {{ include "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.chart" . }}
{{ include "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2a862bd-3da1-4c31-8b0e-7d92b730c260.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}