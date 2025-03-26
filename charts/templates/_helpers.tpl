
{{- define "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.fullname" -}}
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


{{- define "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.labels" -}}
helm.sh/chart: {{ include "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.chart" . }}
{{ include "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo66c29731-c7f7-4cf5-8716-8eb27500624c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}