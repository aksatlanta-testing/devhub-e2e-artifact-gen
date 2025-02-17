
{{- define "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.fullname" -}}
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


{{- define "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.labels" -}}
helm.sh/chart: {{ include "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.chart" . }}
{{ include "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo279dc3a6-4151-4596-a6d0-b6106f47268f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}