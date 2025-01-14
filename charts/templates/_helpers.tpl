
{{- define "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.fullname" -}}
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


{{- define "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.labels" -}}
helm.sh/chart: {{ include "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.chart" . }}
{{ include "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdee9ead-8755-4fc2-a4cd-9bce1cab72a1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}