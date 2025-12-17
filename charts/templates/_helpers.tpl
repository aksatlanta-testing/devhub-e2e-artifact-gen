
{{- define "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.fullname" -}}
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


{{- define "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.labels" -}}
helm.sh/chart: {{ include "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.chart" . }}
{{ include "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c586e9e-e0cb-41d4-b652-9ce7a0d65fbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}