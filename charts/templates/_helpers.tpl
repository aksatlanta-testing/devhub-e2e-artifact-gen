
{{- define "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.fullname" -}}
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


{{- define "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.labels" -}}
helm.sh/chart: {{ include "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.chart" . }}
{{ include "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo779036b6-bcc7-4c6c-8c6c-77e9dd79d4de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}