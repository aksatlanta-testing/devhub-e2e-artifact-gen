
{{- define "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.fullname" -}}
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


{{- define "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.labels" -}}
helm.sh/chart: {{ include "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.chart" . }}
{{ include "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod23e9ade-cec7-4a69-96e8-728b44375f29.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}