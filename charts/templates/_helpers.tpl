
{{- define "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.fullname" -}}
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


{{- define "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.labels" -}}
helm.sh/chart: {{ include "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.chart" . }}
{{ include "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2f669335-4b26-4829-a9df-0b6fd14cdeee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}