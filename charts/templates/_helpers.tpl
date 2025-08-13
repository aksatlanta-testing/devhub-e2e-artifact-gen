
{{- define "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.fullname" -}}
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


{{- define "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.labels" -}}
helm.sh/chart: {{ include "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.chart" . }}
{{ include "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf9b657a-e5d8-468b-8356-b137e8b2e108.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}