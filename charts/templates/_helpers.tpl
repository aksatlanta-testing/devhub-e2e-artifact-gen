
{{- define "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.fullname" -}}
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


{{- define "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.labels" -}}
helm.sh/chart: {{ include "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.chart" . }}
{{ include "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1b4a8258-b007-4281-82e6-bedf876bc6bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}