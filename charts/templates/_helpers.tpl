
{{- define "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.fullname" -}}
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


{{- define "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.labels" -}}
helm.sh/chart: {{ include "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.chart" . }}
{{ include "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo996f7b0e-34c0-4da9-9b4f-4b940a21a8ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}