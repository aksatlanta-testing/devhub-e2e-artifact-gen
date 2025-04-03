
{{- define "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.fullname" -}}
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


{{- define "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.labels" -}}
helm.sh/chart: {{ include "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.chart" . }}
{{ include "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof00e4033-360f-46da-a4f1-f5f62e8db975.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}