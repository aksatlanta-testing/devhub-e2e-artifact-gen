
{{- define "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.fullname" -}}
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


{{- define "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.labels" -}}
helm.sh/chart: {{ include "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.chart" . }}
{{ include "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob0a017a0-7c80-4279-9d08-d176708a4e5a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}