
{{- define "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.fullname" -}}
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


{{- define "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.labels" -}}
helm.sh/chart: {{ include "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.chart" . }}
{{ include "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48970959-6bc5-4f15-87fd-6c6a6a133136.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}