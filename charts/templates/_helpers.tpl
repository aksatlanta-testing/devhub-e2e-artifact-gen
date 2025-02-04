
{{- define "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.fullname" -}}
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


{{- define "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.labels" -}}
helm.sh/chart: {{ include "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.chart" . }}
{{ include "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a3916a0-0570-425d-a8e8-6de5262d6f92.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}