
{{- define "go-echoa98b39db-042e-449d-86e0-25f868e8797d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa98b39db-042e-449d-86e0-25f868e8797d.fullname" -}}
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


{{- define "go-echoa98b39db-042e-449d-86e0-25f868e8797d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa98b39db-042e-449d-86e0-25f868e8797d.labels" -}}
helm.sh/chart: {{ include "go-echoa98b39db-042e-449d-86e0-25f868e8797d.chart" . }}
{{ include "go-echoa98b39db-042e-449d-86e0-25f868e8797d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa98b39db-042e-449d-86e0-25f868e8797d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa98b39db-042e-449d-86e0-25f868e8797d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}