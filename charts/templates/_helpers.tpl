
{{- define "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.fullname" -}}
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


{{- define "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.labels" -}}
helm.sh/chart: {{ include "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.chart" . }}
{{ include "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo251d38cc-3cbe-4471-a53a-b48f2a5800aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}