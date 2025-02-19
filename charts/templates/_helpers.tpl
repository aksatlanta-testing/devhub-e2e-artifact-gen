
{{- define "go-echo408fc9ad-8076-4798-8001-1c7be582356a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo408fc9ad-8076-4798-8001-1c7be582356a.fullname" -}}
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


{{- define "go-echo408fc9ad-8076-4798-8001-1c7be582356a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo408fc9ad-8076-4798-8001-1c7be582356a.labels" -}}
helm.sh/chart: {{ include "go-echo408fc9ad-8076-4798-8001-1c7be582356a.chart" . }}
{{ include "go-echo408fc9ad-8076-4798-8001-1c7be582356a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo408fc9ad-8076-4798-8001-1c7be582356a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo408fc9ad-8076-4798-8001-1c7be582356a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}