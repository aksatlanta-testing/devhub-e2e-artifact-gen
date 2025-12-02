
{{- define "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.fullname" -}}
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


{{- define "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.labels" -}}
helm.sh/chart: {{ include "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.chart" . }}
{{ include "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a5fecaa-8897-40d3-a277-8bdab60a4225.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}