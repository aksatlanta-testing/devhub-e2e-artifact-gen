
{{- define "go-echof4933bca-5901-41b3-a845-cc821aa8946c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4933bca-5901-41b3-a845-cc821aa8946c.fullname" -}}
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


{{- define "go-echof4933bca-5901-41b3-a845-cc821aa8946c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4933bca-5901-41b3-a845-cc821aa8946c.labels" -}}
helm.sh/chart: {{ include "go-echof4933bca-5901-41b3-a845-cc821aa8946c.chart" . }}
{{ include "go-echof4933bca-5901-41b3-a845-cc821aa8946c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4933bca-5901-41b3-a845-cc821aa8946c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4933bca-5901-41b3-a845-cc821aa8946c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}