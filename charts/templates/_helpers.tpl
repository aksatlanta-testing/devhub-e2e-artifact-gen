
{{- define "go-echoedf3b798-94a5-480b-9a03-583c26496642.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedf3b798-94a5-480b-9a03-583c26496642.fullname" -}}
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


{{- define "go-echoedf3b798-94a5-480b-9a03-583c26496642.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedf3b798-94a5-480b-9a03-583c26496642.labels" -}}
helm.sh/chart: {{ include "go-echoedf3b798-94a5-480b-9a03-583c26496642.chart" . }}
{{ include "go-echoedf3b798-94a5-480b-9a03-583c26496642.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedf3b798-94a5-480b-9a03-583c26496642.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedf3b798-94a5-480b-9a03-583c26496642.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}