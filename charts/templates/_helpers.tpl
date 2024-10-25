
{{- define "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.fullname" -}}
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


{{- define "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.labels" -}}
helm.sh/chart: {{ include "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.chart" . }}
{{ include "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5bcaeb76-7bd7-4103-82cd-faab6e523400.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}