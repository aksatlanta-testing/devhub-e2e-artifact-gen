
{{- define "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.fullname" -}}
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


{{- define "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.labels" -}}
helm.sh/chart: {{ include "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.chart" . }}
{{ include "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb6e74e8-16b4-4a90-b3ff-c23537c0e727.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}