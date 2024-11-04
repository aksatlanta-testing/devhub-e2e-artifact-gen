
{{- define "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.fullname" -}}
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


{{- define "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.labels" -}}
helm.sh/chart: {{ include "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.chart" . }}
{{ include "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf3f01c2-5389-4af7-b5fd-a235913582bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}