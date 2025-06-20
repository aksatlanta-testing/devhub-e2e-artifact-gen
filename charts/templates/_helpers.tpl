
{{- define "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.fullname" -}}
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


{{- define "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.labels" -}}
helm.sh/chart: {{ include "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.chart" . }}
{{ include "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf219fd7-c70f-4b88-aaf2-b43f8d5fae8c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}