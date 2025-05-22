
{{- define "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.fullname" -}}
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


{{- define "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.labels" -}}
helm.sh/chart: {{ include "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.chart" . }}
{{ include "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7abb16d2-c7da-4a40-8a22-a5c835d969fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}