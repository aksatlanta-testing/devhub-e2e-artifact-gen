
{{- define "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.fullname" -}}
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


{{- define "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.labels" -}}
helm.sh/chart: {{ include "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.chart" . }}
{{ include "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9b0fd98-b69f-484a-909a-36d2d922b80c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}