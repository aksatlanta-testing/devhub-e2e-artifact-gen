
{{- define "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.fullname" -}}
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


{{- define "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.labels" -}}
helm.sh/chart: {{ include "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.chart" . }}
{{ include "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4bdfe768-3b0d-4122-8c61-b6a3112c243c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}