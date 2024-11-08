
{{- define "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.fullname" -}}
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


{{- define "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.labels" -}}
helm.sh/chart: {{ include "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.chart" . }}
{{ include "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa28be41-dfc7-49b1-a0e5-d5cb062dc5c4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}