
{{- define "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.fullname" -}}
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


{{- define "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.labels" -}}
helm.sh/chart: {{ include "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.chart" . }}
{{ include "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa27a0b2c-3941-49f2-a663-676cc247142d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}