
{{- define "go-echoc514587e-4a32-4e24-88bd-ae934391366c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc514587e-4a32-4e24-88bd-ae934391366c.fullname" -}}
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


{{- define "go-echoc514587e-4a32-4e24-88bd-ae934391366c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc514587e-4a32-4e24-88bd-ae934391366c.labels" -}}
helm.sh/chart: {{ include "go-echoc514587e-4a32-4e24-88bd-ae934391366c.chart" . }}
{{ include "go-echoc514587e-4a32-4e24-88bd-ae934391366c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc514587e-4a32-4e24-88bd-ae934391366c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc514587e-4a32-4e24-88bd-ae934391366c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}