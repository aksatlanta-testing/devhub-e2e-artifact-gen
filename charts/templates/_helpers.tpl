
{{- define "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.fullname" -}}
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


{{- define "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.labels" -}}
helm.sh/chart: {{ include "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.chart" . }}
{{ include "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoef5159c7-bd65-4c20-aa27-49eb4c6b6dd9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}