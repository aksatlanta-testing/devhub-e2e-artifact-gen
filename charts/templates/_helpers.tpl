
{{- define "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.fullname" -}}
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


{{- define "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.labels" -}}
helm.sh/chart: {{ include "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.chart" . }}
{{ include "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9ceb72ff-7ba3-4340-afdd-610019265492.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}