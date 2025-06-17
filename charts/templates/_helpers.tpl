
{{- define "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.fullname" -}}
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


{{- define "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.labels" -}}
helm.sh/chart: {{ include "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.chart" . }}
{{ include "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe45b5c8e-a325-42d0-8155-96fab287d6ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}