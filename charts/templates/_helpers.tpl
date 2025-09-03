
{{- define "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.fullname" -}}
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


{{- define "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.labels" -}}
helm.sh/chart: {{ include "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.chart" . }}
{{ include "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodedcc3ae-846d-4297-a155-4370c9b1a31e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}