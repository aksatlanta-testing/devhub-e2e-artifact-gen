
{{- define "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.fullname" -}}
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


{{- define "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.labels" -}}
helm.sh/chart: {{ include "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.chart" . }}
{{ include "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo77a3f930-c924-4a5c-a5a5-a8f996829b98.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}