
{{- define "go-echode70d760-718c-4285-a012-23b7f8242d9e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode70d760-718c-4285-a012-23b7f8242d9e.fullname" -}}
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


{{- define "go-echode70d760-718c-4285-a012-23b7f8242d9e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode70d760-718c-4285-a012-23b7f8242d9e.labels" -}}
helm.sh/chart: {{ include "go-echode70d760-718c-4285-a012-23b7f8242d9e.chart" . }}
{{ include "go-echode70d760-718c-4285-a012-23b7f8242d9e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode70d760-718c-4285-a012-23b7f8242d9e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode70d760-718c-4285-a012-23b7f8242d9e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}