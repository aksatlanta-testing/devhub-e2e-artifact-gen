
{{- define "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.fullname" -}}
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


{{- define "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.labels" -}}
helm.sh/chart: {{ include "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.chart" . }}
{{ include "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2161081-d972-4a5d-8e2f-79eed1fffdce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}