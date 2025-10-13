
{{- define "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.fullname" -}}
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


{{- define "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.labels" -}}
helm.sh/chart: {{ include "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.chart" . }}
{{ include "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7b5da22-0e7f-4aaa-94c5-fc133166232e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}