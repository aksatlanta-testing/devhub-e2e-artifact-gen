
{{- define "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.fullname" -}}
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


{{- define "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.labels" -}}
helm.sh/chart: {{ include "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.chart" . }}
{{ include "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab35870a-03c7-49d5-9ae5-9808e9a962ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}