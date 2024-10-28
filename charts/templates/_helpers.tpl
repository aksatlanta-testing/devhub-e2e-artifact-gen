
{{- define "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.fullname" -}}
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


{{- define "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.labels" -}}
helm.sh/chart: {{ include "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.chart" . }}
{{ include "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea96940c-e05a-4c16-aaf6-bb7aaafa1712.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}