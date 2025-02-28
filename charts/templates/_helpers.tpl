
{{- define "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.fullname" -}}
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


{{- define "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.labels" -}}
helm.sh/chart: {{ include "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.chart" . }}
{{ include "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo30866c3c-eb61-41d9-967c-3abb894af4ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}