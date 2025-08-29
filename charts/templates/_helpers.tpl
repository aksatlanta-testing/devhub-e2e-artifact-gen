
{{- define "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.fullname" -}}
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


{{- define "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.labels" -}}
helm.sh/chart: {{ include "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.chart" . }}
{{ include "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca9f02fe-0bdf-4bfd-bf29-72596109c44a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}