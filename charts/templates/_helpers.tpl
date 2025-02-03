
{{- define "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.fullname" -}}
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


{{- define "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.labels" -}}
helm.sh/chart: {{ include "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.chart" . }}
{{ include "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4201656d-7f86-4f0a-92c5-38fbac789659.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}