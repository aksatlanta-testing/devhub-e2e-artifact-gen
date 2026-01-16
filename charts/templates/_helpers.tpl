
{{- define "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.fullname" -}}
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


{{- define "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.labels" -}}
helm.sh/chart: {{ include "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.chart" . }}
{{ include "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo479dfe4e-3ac7-48b6-bec6-865ea010953c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}