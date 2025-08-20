
{{- define "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.fullname" -}}
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


{{- define "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.labels" -}}
helm.sh/chart: {{ include "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.chart" . }}
{{ include "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod99631a2-61b2-4a61-8e1a-2c4b7c193dc3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}