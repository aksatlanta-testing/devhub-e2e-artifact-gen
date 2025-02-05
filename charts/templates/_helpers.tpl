
{{- define "go-echo688865b4-52ea-433d-a763-aed8f59abcab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo688865b4-52ea-433d-a763-aed8f59abcab.fullname" -}}
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


{{- define "go-echo688865b4-52ea-433d-a763-aed8f59abcab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo688865b4-52ea-433d-a763-aed8f59abcab.labels" -}}
helm.sh/chart: {{ include "go-echo688865b4-52ea-433d-a763-aed8f59abcab.chart" . }}
{{ include "go-echo688865b4-52ea-433d-a763-aed8f59abcab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo688865b4-52ea-433d-a763-aed8f59abcab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo688865b4-52ea-433d-a763-aed8f59abcab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}