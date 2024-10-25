
{{- define "go-echo938e49e2-3152-429f-b467-70f133d73bfa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo938e49e2-3152-429f-b467-70f133d73bfa.fullname" -}}
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


{{- define "go-echo938e49e2-3152-429f-b467-70f133d73bfa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo938e49e2-3152-429f-b467-70f133d73bfa.labels" -}}
helm.sh/chart: {{ include "go-echo938e49e2-3152-429f-b467-70f133d73bfa.chart" . }}
{{ include "go-echo938e49e2-3152-429f-b467-70f133d73bfa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo938e49e2-3152-429f-b467-70f133d73bfa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo938e49e2-3152-429f-b467-70f133d73bfa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}