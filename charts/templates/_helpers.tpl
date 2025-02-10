
{{- define "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.fullname" -}}
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


{{- define "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.labels" -}}
helm.sh/chart: {{ include "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.chart" . }}
{{ include "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd723ff7-d958-4048-9a3a-b938f13a5ecb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}