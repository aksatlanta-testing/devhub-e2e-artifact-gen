
{{- define "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.fullname" -}}
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


{{- define "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.labels" -}}
helm.sh/chart: {{ include "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.chart" . }}
{{ include "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo845c5a62-2bb3-43b8-a729-5fadb57fd51f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}