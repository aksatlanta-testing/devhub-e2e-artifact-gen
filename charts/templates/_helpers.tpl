
{{- define "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.fullname" -}}
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


{{- define "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.labels" -}}
helm.sh/chart: {{ include "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.chart" . }}
{{ include "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo77290144-bed1-4980-91e6-f1bf6d7ca1db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}