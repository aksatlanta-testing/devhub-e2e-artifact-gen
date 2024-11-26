
{{- define "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.fullname" -}}
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


{{- define "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.labels" -}}
helm.sh/chart: {{ include "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.chart" . }}
{{ include "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6c6dfef6-90c3-49de-a027-534953000d1d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}