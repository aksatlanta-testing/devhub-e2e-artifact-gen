
{{- define "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.fullname" -}}
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


{{- define "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.labels" -}}
helm.sh/chart: {{ include "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.chart" . }}
{{ include "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9e18c685-c2f4-4f48-9dfc-28c0255662ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}