
{{- define "go-echoa883c448-d469-4e62-9010-40f6a337d132.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa883c448-d469-4e62-9010-40f6a337d132.fullname" -}}
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


{{- define "go-echoa883c448-d469-4e62-9010-40f6a337d132.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa883c448-d469-4e62-9010-40f6a337d132.labels" -}}
helm.sh/chart: {{ include "go-echoa883c448-d469-4e62-9010-40f6a337d132.chart" . }}
{{ include "go-echoa883c448-d469-4e62-9010-40f6a337d132.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa883c448-d469-4e62-9010-40f6a337d132.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa883c448-d469-4e62-9010-40f6a337d132.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}