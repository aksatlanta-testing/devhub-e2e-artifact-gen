
{{- define "go-echod611a3db-e9bd-4a20-a668-528414d09842.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod611a3db-e9bd-4a20-a668-528414d09842.fullname" -}}
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


{{- define "go-echod611a3db-e9bd-4a20-a668-528414d09842.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod611a3db-e9bd-4a20-a668-528414d09842.labels" -}}
helm.sh/chart: {{ include "go-echod611a3db-e9bd-4a20-a668-528414d09842.chart" . }}
{{ include "go-echod611a3db-e9bd-4a20-a668-528414d09842.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod611a3db-e9bd-4a20-a668-528414d09842.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod611a3db-e9bd-4a20-a668-528414d09842.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}