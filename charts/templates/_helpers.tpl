
{{- define "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.fullname" -}}
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


{{- define "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.labels" -}}
helm.sh/chart: {{ include "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.chart" . }}
{{ include "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa31e7e57-17a1-45ce-8a39-63b88339e99e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}