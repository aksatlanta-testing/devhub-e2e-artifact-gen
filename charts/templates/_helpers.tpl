
{{- define "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.fullname" -}}
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


{{- define "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.labels" -}}
helm.sh/chart: {{ include "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.chart" . }}
{{ include "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo941f2790-a1c2-4fd6-b598-0b1715c64666.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}