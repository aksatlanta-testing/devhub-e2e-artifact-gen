
{{- define "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.fullname" -}}
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


{{- define "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.labels" -}}
helm.sh/chart: {{ include "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.chart" . }}
{{ include "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfd0ed62-9a21-4b6a-bfd3-c566ff982da6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}