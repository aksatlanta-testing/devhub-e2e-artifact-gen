
{{- define "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.fullname" -}}
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


{{- define "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.labels" -}}
helm.sh/chart: {{ include "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.chart" . }}
{{ include "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo291e96dc-6d8d-4afb-825c-0d4c6b851fcc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}