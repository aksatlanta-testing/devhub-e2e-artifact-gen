
{{- define "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.fullname" -}}
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


{{- define "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.labels" -}}
helm.sh/chart: {{ include "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.chart" . }}
{{ include "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc57c16c-85bb-447d-b635-74fd619ae83a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}