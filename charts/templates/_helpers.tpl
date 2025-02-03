
{{- define "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.fullname" -}}
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


{{- define "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.labels" -}}
helm.sh/chart: {{ include "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.chart" . }}
{{ include "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9fe27b49-4fd7-44c9-bd69-47f371746afa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}