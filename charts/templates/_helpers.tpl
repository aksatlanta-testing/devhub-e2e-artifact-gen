
{{- define "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.fullname" -}}
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


{{- define "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.labels" -}}
helm.sh/chart: {{ include "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.chart" . }}
{{ include "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a246002-098b-49cf-9c43-1b2a4829e47b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}