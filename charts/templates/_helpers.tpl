
{{- define "go-echo617e0652-7c44-4270-9c8c-b122083b30df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo617e0652-7c44-4270-9c8c-b122083b30df.fullname" -}}
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


{{- define "go-echo617e0652-7c44-4270-9c8c-b122083b30df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo617e0652-7c44-4270-9c8c-b122083b30df.labels" -}}
helm.sh/chart: {{ include "go-echo617e0652-7c44-4270-9c8c-b122083b30df.chart" . }}
{{ include "go-echo617e0652-7c44-4270-9c8c-b122083b30df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo617e0652-7c44-4270-9c8c-b122083b30df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo617e0652-7c44-4270-9c8c-b122083b30df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}