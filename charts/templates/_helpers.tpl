
{{- define "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.fullname" -}}
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


{{- define "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.labels" -}}
helm.sh/chart: {{ include "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.chart" . }}
{{ include "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda20641d-16c4-44cc-88df-f2f457bf3b68.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}