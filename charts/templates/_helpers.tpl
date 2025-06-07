
{{- define "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.fullname" -}}
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


{{- define "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.labels" -}}
helm.sh/chart: {{ include "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.chart" . }}
{{ include "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2a1c2e6f-5307-4105-9868-a389c8d46759.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}