
{{- define "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.fullname" -}}
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


{{- define "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.labels" -}}
helm.sh/chart: {{ include "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.chart" . }}
{{ include "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo443bae69-4d71-45be-9a72-0e6801f7265b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}