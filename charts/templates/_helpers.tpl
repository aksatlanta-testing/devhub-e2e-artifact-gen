
{{- define "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.fullname" -}}
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


{{- define "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.labels" -}}
helm.sh/chart: {{ include "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.chart" . }}
{{ include "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo024a9d38-043f-432c-8d1d-bfe2c7a14119.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}