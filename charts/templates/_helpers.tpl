
{{- define "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.fullname" -}}
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


{{- define "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.labels" -}}
helm.sh/chart: {{ include "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.chart" . }}
{{ include "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo824ef523-d762-454b-9e8a-23b73d79a21f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}