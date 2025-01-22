
{{- define "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.fullname" -}}
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


{{- define "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.labels" -}}
helm.sh/chart: {{ include "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.chart" . }}
{{ include "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9db561f-88d7-46f0-a4de-c236e9743f78.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}