
{{- define "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.fullname" -}}
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


{{- define "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.labels" -}}
helm.sh/chart: {{ include "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.chart" . }}
{{ include "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e8dd575-0830-46fb-9939-90b836d73d9a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}