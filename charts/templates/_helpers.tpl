
{{- define "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.fullname" -}}
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


{{- define "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.labels" -}}
helm.sh/chart: {{ include "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.chart" . }}
{{ include "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4063e2d3-34d3-4e1d-96ef-422d4e9278ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}