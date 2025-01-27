
{{- define "go-echob3f7be98-6634-408a-8d12-297697ede3ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3f7be98-6634-408a-8d12-297697ede3ba.fullname" -}}
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


{{- define "go-echob3f7be98-6634-408a-8d12-297697ede3ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3f7be98-6634-408a-8d12-297697ede3ba.labels" -}}
helm.sh/chart: {{ include "go-echob3f7be98-6634-408a-8d12-297697ede3ba.chart" . }}
{{ include "go-echob3f7be98-6634-408a-8d12-297697ede3ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3f7be98-6634-408a-8d12-297697ede3ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3f7be98-6634-408a-8d12-297697ede3ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}