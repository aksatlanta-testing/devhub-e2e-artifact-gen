
{{- define "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.fullname" -}}
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


{{- define "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.labels" -}}
helm.sh/chart: {{ include "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.chart" . }}
{{ include "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo432ed4c0-ab4e-4b78-ac7f-7fa5ce356475.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}