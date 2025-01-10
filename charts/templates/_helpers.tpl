
{{- define "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.fullname" -}}
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


{{- define "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.labels" -}}
helm.sh/chart: {{ include "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.chart" . }}
{{ include "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e7a44fc-1562-4e6a-a521-51bbc588b62d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}