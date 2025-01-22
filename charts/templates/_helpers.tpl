
{{- define "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.fullname" -}}
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


{{- define "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.labels" -}}
helm.sh/chart: {{ include "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.chart" . }}
{{ include "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo52e67080-0afe-45c8-b7c4-cb32945835fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}