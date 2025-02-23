
{{- define "go-echo26c07009-bca6-4e80-93f3-0520be64403c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo26c07009-bca6-4e80-93f3-0520be64403c.fullname" -}}
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


{{- define "go-echo26c07009-bca6-4e80-93f3-0520be64403c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo26c07009-bca6-4e80-93f3-0520be64403c.labels" -}}
helm.sh/chart: {{ include "go-echo26c07009-bca6-4e80-93f3-0520be64403c.chart" . }}
{{ include "go-echo26c07009-bca6-4e80-93f3-0520be64403c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo26c07009-bca6-4e80-93f3-0520be64403c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo26c07009-bca6-4e80-93f3-0520be64403c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}