
{{- define "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.fullname" -}}
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


{{- define "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.labels" -}}
helm.sh/chart: {{ include "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.chart" . }}
{{ include "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd9883f8-3c21-484a-bb8d-3f72e7ce3252.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}