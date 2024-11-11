
{{- define "go-echo6be22e32-e8b1-465b-a261-999948ea2120.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6be22e32-e8b1-465b-a261-999948ea2120.fullname" -}}
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


{{- define "go-echo6be22e32-e8b1-465b-a261-999948ea2120.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6be22e32-e8b1-465b-a261-999948ea2120.labels" -}}
helm.sh/chart: {{ include "go-echo6be22e32-e8b1-465b-a261-999948ea2120.chart" . }}
{{ include "go-echo6be22e32-e8b1-465b-a261-999948ea2120.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6be22e32-e8b1-465b-a261-999948ea2120.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6be22e32-e8b1-465b-a261-999948ea2120.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}