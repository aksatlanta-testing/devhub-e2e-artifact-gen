
{{- define "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.fullname" -}}
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


{{- define "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.labels" -}}
helm.sh/chart: {{ include "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.chart" . }}
{{ include "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41e571e8-6155-4680-844c-c1e0baf9cabc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}