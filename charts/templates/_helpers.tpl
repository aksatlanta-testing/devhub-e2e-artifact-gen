
{{- define "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.fullname" -}}
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


{{- define "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.labels" -}}
helm.sh/chart: {{ include "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.chart" . }}
{{ include "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod62b2c8d-39b4-4709-89b3-a1c3dc25b8ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}