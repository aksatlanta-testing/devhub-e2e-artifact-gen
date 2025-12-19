
{{- define "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.fullname" -}}
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


{{- define "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.labels" -}}
helm.sh/chart: {{ include "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.chart" . }}
{{ include "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfa6ab4f-09ba-470d-8613-3253f1bf8070.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}