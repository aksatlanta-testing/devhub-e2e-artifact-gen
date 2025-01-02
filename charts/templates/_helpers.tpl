
{{- define "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.fullname" -}}
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


{{- define "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.labels" -}}
helm.sh/chart: {{ include "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.chart" . }}
{{ include "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6e0500d6-c443-4a92-90d7-5d6e402e9cac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}