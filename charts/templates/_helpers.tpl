
{{- define "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.fullname" -}}
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


{{- define "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.labels" -}}
helm.sh/chart: {{ include "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.chart" . }}
{{ include "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofaaae87f-125b-422f-91e8-cefe0d4b8509.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}