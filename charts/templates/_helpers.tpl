
{{- define "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.fullname" -}}
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


{{- define "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.labels" -}}
helm.sh/chart: {{ include "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.chart" . }}
{{ include "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo021cb11d-ca9d-4f66-a8b6-3bbc8690d9ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}