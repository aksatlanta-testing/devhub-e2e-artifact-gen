
{{- define "go-echo245f8b18-c247-4f27-983e-a930468f988e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo245f8b18-c247-4f27-983e-a930468f988e.fullname" -}}
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


{{- define "go-echo245f8b18-c247-4f27-983e-a930468f988e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo245f8b18-c247-4f27-983e-a930468f988e.labels" -}}
helm.sh/chart: {{ include "go-echo245f8b18-c247-4f27-983e-a930468f988e.chart" . }}
{{ include "go-echo245f8b18-c247-4f27-983e-a930468f988e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo245f8b18-c247-4f27-983e-a930468f988e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo245f8b18-c247-4f27-983e-a930468f988e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}