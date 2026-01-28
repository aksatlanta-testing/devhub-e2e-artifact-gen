
{{- define "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.fullname" -}}
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


{{- define "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.labels" -}}
helm.sh/chart: {{ include "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.chart" . }}
{{ include "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe86ef8da-ef66-40cc-a8e6-5b99d190b00b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}