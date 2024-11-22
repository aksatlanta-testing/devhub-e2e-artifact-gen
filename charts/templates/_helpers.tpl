
{{- define "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.fullname" -}}
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


{{- define "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.labels" -}}
helm.sh/chart: {{ include "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.chart" . }}
{{ include "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d77d6d9-dd19-45de-9beb-01d87cac0b4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}