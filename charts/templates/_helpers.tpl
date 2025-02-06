
{{- define "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.fullname" -}}
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


{{- define "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.labels" -}}
helm.sh/chart: {{ include "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.chart" . }}
{{ include "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc26fa95d-cf33-4aef-bfaa-dee63c39f5cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}