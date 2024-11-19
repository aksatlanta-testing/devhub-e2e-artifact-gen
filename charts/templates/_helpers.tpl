
{{- define "go-echofdcc371c-24f4-494e-a193-69918e8710ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofdcc371c-24f4-494e-a193-69918e8710ae.fullname" -}}
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


{{- define "go-echofdcc371c-24f4-494e-a193-69918e8710ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofdcc371c-24f4-494e-a193-69918e8710ae.labels" -}}
helm.sh/chart: {{ include "go-echofdcc371c-24f4-494e-a193-69918e8710ae.chart" . }}
{{ include "go-echofdcc371c-24f4-494e-a193-69918e8710ae.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofdcc371c-24f4-494e-a193-69918e8710ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofdcc371c-24f4-494e-a193-69918e8710ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}