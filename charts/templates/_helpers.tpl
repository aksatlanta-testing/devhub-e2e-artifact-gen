
{{- define "go-echobae735ee-ade0-4947-afb7-1af657c5b664.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobae735ee-ade0-4947-afb7-1af657c5b664.fullname" -}}
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


{{- define "go-echobae735ee-ade0-4947-afb7-1af657c5b664.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobae735ee-ade0-4947-afb7-1af657c5b664.labels" -}}
helm.sh/chart: {{ include "go-echobae735ee-ade0-4947-afb7-1af657c5b664.chart" . }}
{{ include "go-echobae735ee-ade0-4947-afb7-1af657c5b664.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobae735ee-ade0-4947-afb7-1af657c5b664.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobae735ee-ade0-4947-afb7-1af657c5b664.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}