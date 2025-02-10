
{{- define "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.fullname" -}}
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


{{- define "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.labels" -}}
helm.sh/chart: {{ include "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.chart" . }}
{{ include "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo85bccf42-edbd-4203-a9a0-be73b553e76b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}