
{{- define "go-echodf82a59e-ece5-4d16-8660-64da9377d310.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf82a59e-ece5-4d16-8660-64da9377d310.fullname" -}}
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


{{- define "go-echodf82a59e-ece5-4d16-8660-64da9377d310.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf82a59e-ece5-4d16-8660-64da9377d310.labels" -}}
helm.sh/chart: {{ include "go-echodf82a59e-ece5-4d16-8660-64da9377d310.chart" . }}
{{ include "go-echodf82a59e-ece5-4d16-8660-64da9377d310.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf82a59e-ece5-4d16-8660-64da9377d310.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf82a59e-ece5-4d16-8660-64da9377d310.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}