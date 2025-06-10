
{{- define "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.fullname" -}}
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


{{- define "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.labels" -}}
helm.sh/chart: {{ include "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.chart" . }}
{{ include "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo949dd972-f698-4b8a-a0f3-607a770c28ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}