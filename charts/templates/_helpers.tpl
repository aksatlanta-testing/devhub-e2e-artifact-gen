
{{- define "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.fullname" -}}
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


{{- define "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.labels" -}}
helm.sh/chart: {{ include "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.chart" . }}
{{ include "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2d95e1a-abf4-474a-bb44-f840b620651a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}