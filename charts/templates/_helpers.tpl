
{{- define "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.fullname" -}}
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


{{- define "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.labels" -}}
helm.sh/chart: {{ include "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.chart" . }}
{{ include "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b06edb0-1858-4a7d-82fa-36bd2a71e090.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}