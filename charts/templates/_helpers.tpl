
{{- define "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.fullname" -}}
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


{{- define "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.labels" -}}
helm.sh/chart: {{ include "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.chart" . }}
{{ include "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5414ca2-c4c3-45e7-9217-ce0f71c504ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}