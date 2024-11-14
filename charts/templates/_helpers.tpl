
{{- define "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.fullname" -}}
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


{{- define "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.labels" -}}
helm.sh/chart: {{ include "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.chart" . }}
{{ include "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo74272ec4-6f56-4cf9-9997-904b8e64a57e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}