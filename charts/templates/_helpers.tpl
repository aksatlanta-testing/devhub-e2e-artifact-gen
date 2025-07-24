
{{- define "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.fullname" -}}
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


{{- define "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.labels" -}}
helm.sh/chart: {{ include "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.chart" . }}
{{ include "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeafe2bfe-3c63-4e91-ab10-e958e77ae9dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}