
{{- define "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.fullname" -}}
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


{{- define "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.labels" -}}
helm.sh/chart: {{ include "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.chart" . }}
{{ include "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7d70a18-21bf-486a-9871-d7a3ca1374dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}