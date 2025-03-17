
{{- define "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.fullname" -}}
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


{{- define "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.labels" -}}
helm.sh/chart: {{ include "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.chart" . }}
{{ include "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo92e2ec7b-91bb-4c53-905b-ff2694e7c7be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}