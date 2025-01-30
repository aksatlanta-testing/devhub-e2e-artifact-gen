
{{- define "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.fullname" -}}
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


{{- define "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.labels" -}}
helm.sh/chart: {{ include "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.chart" . }}
{{ include "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob06c9730-78e9-4a29-ae3c-27d62b1e4e8b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}