
{{- define "go-echo96c46a2b-e341-426f-a756-b3834feeabac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo96c46a2b-e341-426f-a756-b3834feeabac.fullname" -}}
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


{{- define "go-echo96c46a2b-e341-426f-a756-b3834feeabac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo96c46a2b-e341-426f-a756-b3834feeabac.labels" -}}
helm.sh/chart: {{ include "go-echo96c46a2b-e341-426f-a756-b3834feeabac.chart" . }}
{{ include "go-echo96c46a2b-e341-426f-a756-b3834feeabac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo96c46a2b-e341-426f-a756-b3834feeabac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo96c46a2b-e341-426f-a756-b3834feeabac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}