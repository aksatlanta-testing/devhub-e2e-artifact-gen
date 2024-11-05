
{{- define "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.fullname" -}}
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


{{- define "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.labels" -}}
helm.sh/chart: {{ include "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.chart" . }}
{{ include "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofaa5b15c-75bb-453d-aef2-102bb1bcc437.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}