
{{- define "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.fullname" -}}
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


{{- define "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.labels" -}}
helm.sh/chart: {{ include "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.chart" . }}
{{ include "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda104364-31bc-48b5-9483-8ea6173f5a80.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}