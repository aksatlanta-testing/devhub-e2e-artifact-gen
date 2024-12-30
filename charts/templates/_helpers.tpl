
{{- define "go-echo1cd70528-07b3-4527-9600-9825c4291157.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1cd70528-07b3-4527-9600-9825c4291157.fullname" -}}
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


{{- define "go-echo1cd70528-07b3-4527-9600-9825c4291157.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1cd70528-07b3-4527-9600-9825c4291157.labels" -}}
helm.sh/chart: {{ include "go-echo1cd70528-07b3-4527-9600-9825c4291157.chart" . }}
{{ include "go-echo1cd70528-07b3-4527-9600-9825c4291157.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1cd70528-07b3-4527-9600-9825c4291157.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1cd70528-07b3-4527-9600-9825c4291157.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}