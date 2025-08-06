
{{- define "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.fullname" -}}
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


{{- define "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.labels" -}}
helm.sh/chart: {{ include "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.chart" . }}
{{ include "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9b59a371-05f2-457c-9903-333a9e2431ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}