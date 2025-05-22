
{{- define "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.fullname" -}}
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


{{- define "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.labels" -}}
helm.sh/chart: {{ include "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.chart" . }}
{{ include "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo63044f5d-2c7c-4928-acc7-1ad8e85922bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}