
{{- define "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.fullname" -}}
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


{{- define "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.labels" -}}
helm.sh/chart: {{ include "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.chart" . }}
{{ include "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95dbb477-4fff-49a4-b12e-8f199082f881.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}