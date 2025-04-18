
{{- define "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.fullname" -}}
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


{{- define "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.labels" -}}
helm.sh/chart: {{ include "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.chart" . }}
{{ include "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08f99e9c-d755-4599-8eef-0fa1e18ce8aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}