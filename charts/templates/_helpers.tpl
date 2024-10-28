
{{- define "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.fullname" -}}
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


{{- define "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.labels" -}}
helm.sh/chart: {{ include "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.chart" . }}
{{ include "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo975af3e9-27b2-409b-8f34-09814f5d3f72.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}