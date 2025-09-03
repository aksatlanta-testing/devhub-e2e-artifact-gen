
{{- define "go-echo98572878-946f-4549-bc9d-2d8d320ba836.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo98572878-946f-4549-bc9d-2d8d320ba836.fullname" -}}
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


{{- define "go-echo98572878-946f-4549-bc9d-2d8d320ba836.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo98572878-946f-4549-bc9d-2d8d320ba836.labels" -}}
helm.sh/chart: {{ include "go-echo98572878-946f-4549-bc9d-2d8d320ba836.chart" . }}
{{ include "go-echo98572878-946f-4549-bc9d-2d8d320ba836.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo98572878-946f-4549-bc9d-2d8d320ba836.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo98572878-946f-4549-bc9d-2d8d320ba836.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}