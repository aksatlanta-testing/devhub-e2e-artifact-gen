
{{- define "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.fullname" -}}
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


{{- define "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.labels" -}}
helm.sh/chart: {{ include "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.chart" . }}
{{ include "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6f6dd121-0ede-41b7-90b6-ca7c59afad97.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}