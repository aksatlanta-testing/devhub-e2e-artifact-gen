
{{- define "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.fullname" -}}
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


{{- define "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.labels" -}}
helm.sh/chart: {{ include "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.chart" . }}
{{ include "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa5c74583-11f6-4419-ae15-7d2b05153ec8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}