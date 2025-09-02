
{{- define "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.fullname" -}}
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


{{- define "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.labels" -}}
helm.sh/chart: {{ include "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.chart" . }}
{{ include "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8454d838-c1cc-447e-b63a-6e594b01f43f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}