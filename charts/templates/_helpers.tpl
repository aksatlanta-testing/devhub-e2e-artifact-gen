
{{- define "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.fullname" -}}
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


{{- define "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.labels" -}}
helm.sh/chart: {{ include "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.chart" . }}
{{ include "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoade976d4-a61c-46a7-9760-2e6d80baf1bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}