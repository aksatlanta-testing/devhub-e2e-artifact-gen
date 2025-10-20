
{{- define "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.fullname" -}}
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


{{- define "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.labels" -}}
helm.sh/chart: {{ include "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.chart" . }}
{{ include "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofea89148-57dc-4800-8dec-aab78ab6fd85.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}