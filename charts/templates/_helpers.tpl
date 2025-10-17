
{{- define "go-echo40f77233-f7ad-455d-b491-cd3320a51379.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo40f77233-f7ad-455d-b491-cd3320a51379.fullname" -}}
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


{{- define "go-echo40f77233-f7ad-455d-b491-cd3320a51379.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo40f77233-f7ad-455d-b491-cd3320a51379.labels" -}}
helm.sh/chart: {{ include "go-echo40f77233-f7ad-455d-b491-cd3320a51379.chart" . }}
{{ include "go-echo40f77233-f7ad-455d-b491-cd3320a51379.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo40f77233-f7ad-455d-b491-cd3320a51379.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo40f77233-f7ad-455d-b491-cd3320a51379.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}