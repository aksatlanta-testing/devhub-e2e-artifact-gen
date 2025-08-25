
{{- define "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.fullname" -}}
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


{{- define "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.labels" -}}
helm.sh/chart: {{ include "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.chart" . }}
{{ include "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9854aedd-31e4-4b9c-9d2a-1992058fd2ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}