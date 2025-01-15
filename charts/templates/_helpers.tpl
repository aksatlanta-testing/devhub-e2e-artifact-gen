
{{- define "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.fullname" -}}
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


{{- define "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.labels" -}}
helm.sh/chart: {{ include "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.chart" . }}
{{ include "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa450cf1d-00ab-40a4-83da-7206b9c29ede.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}