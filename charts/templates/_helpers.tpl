
{{- define "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.fullname" -}}
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


{{- define "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.labels" -}}
helm.sh/chart: {{ include "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.chart" . }}
{{ include "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo12e5abc6-f2bf-45f2-8d52-4663e3e15b22.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}