
{{- define "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.fullname" -}}
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


{{- define "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.labels" -}}
helm.sh/chart: {{ include "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.chart" . }}
{{ include "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa50c23e4-3a6b-4021-80bf-10c85f744349.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}