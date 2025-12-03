
{{- define "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.fullname" -}}
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


{{- define "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.labels" -}}
helm.sh/chart: {{ include "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.chart" . }}
{{ include "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffbf73b2-7e7f-4e8b-a155-9c03ccd99ffe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}