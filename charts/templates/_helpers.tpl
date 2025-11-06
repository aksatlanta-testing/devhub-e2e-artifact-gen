
{{- define "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.fullname" -}}
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


{{- define "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.labels" -}}
helm.sh/chart: {{ include "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.chart" . }}
{{ include "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo37a1bdf6-7378-42f1-b92a-1d6904b1c245.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}