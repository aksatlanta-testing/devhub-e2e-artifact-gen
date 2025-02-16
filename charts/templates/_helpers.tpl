
{{- define "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.fullname" -}}
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


{{- define "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.labels" -}}
helm.sh/chart: {{ include "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.chart" . }}
{{ include "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod11cbb1c-35a7-421a-bf46-2a3e4ed6b353.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}