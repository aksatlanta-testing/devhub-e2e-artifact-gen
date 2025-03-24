
{{- define "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.fullname" -}}
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


{{- define "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.labels" -}}
helm.sh/chart: {{ include "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.chart" . }}
{{ include "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1a55fea-47b1-4a10-a5a2-339a7095e049.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}