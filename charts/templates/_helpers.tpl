
{{- define "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.fullname" -}}
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


{{- define "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.labels" -}}
helm.sh/chart: {{ include "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.chart" . }}
{{ include "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49a8152f-1f3f-4d7f-aeb8-dd1bd33a4c80.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}