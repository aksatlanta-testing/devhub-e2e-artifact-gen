
{{- define "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.fullname" -}}
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


{{- define "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.labels" -}}
helm.sh/chart: {{ include "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.chart" . }}
{{ include "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobded6edb-96e4-4fab-97b4-24fa426b68ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}