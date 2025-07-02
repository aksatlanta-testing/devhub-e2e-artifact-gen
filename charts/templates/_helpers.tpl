
{{- define "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.fullname" -}}
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


{{- define "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.labels" -}}
helm.sh/chart: {{ include "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.chart" . }}
{{ include "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf7d432b-3b7a-4d0c-bb27-6d89db4ccf43.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}