
{{- define "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.fullname" -}}
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


{{- define "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.labels" -}}
helm.sh/chart: {{ include "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.chart" . }}
{{ include "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6f8598c5-6919-4f0e-9eff-b5df00694214.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}