
{{- define "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.fullname" -}}
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


{{- define "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.labels" -}}
helm.sh/chart: {{ include "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.chart" . }}
{{ include "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7c453873-71f3-4058-8f78-f5b5527fc5dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}