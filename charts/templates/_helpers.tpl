
{{- define "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.fullname" -}}
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


{{- define "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.labels" -}}
helm.sh/chart: {{ include "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.chart" . }}
{{ include "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc3a99a07-c390-4c99-a268-a8ff4a5de400.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}