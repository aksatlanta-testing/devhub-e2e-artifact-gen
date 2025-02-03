
{{- define "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.fullname" -}}
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


{{- define "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.labels" -}}
helm.sh/chart: {{ include "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.chart" . }}
{{ include "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo90e200d3-7c3a-4145-8daf-d3d9b50c95ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}