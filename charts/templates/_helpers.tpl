
{{- define "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.fullname" -}}
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


{{- define "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.labels" -}}
helm.sh/chart: {{ include "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.chart" . }}
{{ include "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo56aadd0e-c57f-4521-86b1-944cb95e5f9f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}