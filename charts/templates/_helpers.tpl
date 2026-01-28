
{{- define "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.fullname" -}}
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


{{- define "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.labels" -}}
helm.sh/chart: {{ include "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.chart" . }}
{{ include "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo490cb14a-cada-478a-9f9d-8c69caa8261e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}