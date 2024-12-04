
{{- define "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.fullname" -}}
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


{{- define "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.labels" -}}
helm.sh/chart: {{ include "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.chart" . }}
{{ include "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo537579a3-2b8b-415d-98fa-a2cdd60d26bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}