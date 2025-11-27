
{{- define "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.fullname" -}}
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


{{- define "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.labels" -}}
helm.sh/chart: {{ include "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.chart" . }}
{{ include "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5e6e5c9-d3b9-4618-a3bd-c380ae2cb0e1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}