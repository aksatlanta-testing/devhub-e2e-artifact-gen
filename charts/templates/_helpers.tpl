
{{- define "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.fullname" -}}
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


{{- define "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.labels" -}}
helm.sh/chart: {{ include "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.chart" . }}
{{ include "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe933876b-8d29-4fdb-b682-08bcb416510c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}