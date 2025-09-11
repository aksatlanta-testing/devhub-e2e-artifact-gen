
{{- define "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.fullname" -}}
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


{{- define "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.labels" -}}
helm.sh/chart: {{ include "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.chart" . }}
{{ include "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob4bf9049-bee7-4ca2-b770-3899a04927ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}