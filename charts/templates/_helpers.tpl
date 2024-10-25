
{{- define "go-echocca50b32-ca07-4759-852d-17d061af1677.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocca50b32-ca07-4759-852d-17d061af1677.fullname" -}}
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


{{- define "go-echocca50b32-ca07-4759-852d-17d061af1677.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocca50b32-ca07-4759-852d-17d061af1677.labels" -}}
helm.sh/chart: {{ include "go-echocca50b32-ca07-4759-852d-17d061af1677.chart" . }}
{{ include "go-echocca50b32-ca07-4759-852d-17d061af1677.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocca50b32-ca07-4759-852d-17d061af1677.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocca50b32-ca07-4759-852d-17d061af1677.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}