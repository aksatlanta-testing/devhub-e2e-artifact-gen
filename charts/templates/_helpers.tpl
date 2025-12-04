
{{- define "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.fullname" -}}
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


{{- define "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.labels" -}}
helm.sh/chart: {{ include "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.chart" . }}
{{ include "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee3e0974-5ae2-4983-b140-f8068cb0beec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}