
{{- define "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.fullname" -}}
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


{{- define "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.labels" -}}
helm.sh/chart: {{ include "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.chart" . }}
{{ include "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3619f24-d85c-4696-88b4-9a213c999c5d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}