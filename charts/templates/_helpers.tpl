
{{- define "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.fullname" -}}
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


{{- define "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.labels" -}}
helm.sh/chart: {{ include "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.chart" . }}
{{ include "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5fd5ada-4c20-4609-9397-79144ede1fac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}