
{{- define "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.fullname" -}}
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


{{- define "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.labels" -}}
helm.sh/chart: {{ include "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.chart" . }}
{{ include "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod20c9aaa-1486-4fd8-91dc-7cc220e6d9ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}