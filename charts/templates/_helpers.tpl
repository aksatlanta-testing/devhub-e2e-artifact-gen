
{{- define "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.fullname" -}}
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


{{- define "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.labels" -}}
helm.sh/chart: {{ include "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.chart" . }}
{{ include "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4de19a4b-c2ac-4f42-b4fd-9be0bb81e30b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}