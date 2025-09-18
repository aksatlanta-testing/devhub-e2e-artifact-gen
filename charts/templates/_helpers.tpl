
{{- define "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.fullname" -}}
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


{{- define "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.labels" -}}
helm.sh/chart: {{ include "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.chart" . }}
{{ include "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa2eb0e1-1026-4728-8f81-8b077784673b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}