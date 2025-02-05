
{{- define "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.fullname" -}}
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


{{- define "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.labels" -}}
helm.sh/chart: {{ include "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.chart" . }}
{{ include "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa368da5a-25b7-4e21-bd1b-e4f2126d5a26.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}