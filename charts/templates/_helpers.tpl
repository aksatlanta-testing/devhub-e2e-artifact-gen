
{{- define "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.fullname" -}}
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


{{- define "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.labels" -}}
helm.sh/chart: {{ include "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.chart" . }}
{{ include "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac9c1e76-9a51-4d3a-92f8-91bcfed1073a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}