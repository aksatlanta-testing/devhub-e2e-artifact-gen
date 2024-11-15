
{{- define "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.fullname" -}}
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


{{- define "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.labels" -}}
helm.sh/chart: {{ include "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.chart" . }}
{{ include "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca9f99f0-b405-4f7a-80ba-42eea6346c88.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}