
{{- define "go-echo5d567839-510a-40a8-92df-71f76d1052eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d567839-510a-40a8-92df-71f76d1052eb.fullname" -}}
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


{{- define "go-echo5d567839-510a-40a8-92df-71f76d1052eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d567839-510a-40a8-92df-71f76d1052eb.labels" -}}
helm.sh/chart: {{ include "go-echo5d567839-510a-40a8-92df-71f76d1052eb.chart" . }}
{{ include "go-echo5d567839-510a-40a8-92df-71f76d1052eb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d567839-510a-40a8-92df-71f76d1052eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d567839-510a-40a8-92df-71f76d1052eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}