
{{- define "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.fullname" -}}
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


{{- define "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.labels" -}}
helm.sh/chart: {{ include "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.chart" . }}
{{ include "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa08107ac-f689-43df-86b5-6b56380a97ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}