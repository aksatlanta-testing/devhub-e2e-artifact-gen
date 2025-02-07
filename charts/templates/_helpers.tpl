
{{- define "go-echo268add7a-a01d-4d11-8749-bc18cf167149.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo268add7a-a01d-4d11-8749-bc18cf167149.fullname" -}}
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


{{- define "go-echo268add7a-a01d-4d11-8749-bc18cf167149.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo268add7a-a01d-4d11-8749-bc18cf167149.labels" -}}
helm.sh/chart: {{ include "go-echo268add7a-a01d-4d11-8749-bc18cf167149.chart" . }}
{{ include "go-echo268add7a-a01d-4d11-8749-bc18cf167149.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo268add7a-a01d-4d11-8749-bc18cf167149.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo268add7a-a01d-4d11-8749-bc18cf167149.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}