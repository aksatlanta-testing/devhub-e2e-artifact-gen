
{{- define "go-echo686735fa-21e0-49de-b016-730883d89eac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo686735fa-21e0-49de-b016-730883d89eac.fullname" -}}
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


{{- define "go-echo686735fa-21e0-49de-b016-730883d89eac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo686735fa-21e0-49de-b016-730883d89eac.labels" -}}
helm.sh/chart: {{ include "go-echo686735fa-21e0-49de-b016-730883d89eac.chart" . }}
{{ include "go-echo686735fa-21e0-49de-b016-730883d89eac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo686735fa-21e0-49de-b016-730883d89eac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo686735fa-21e0-49de-b016-730883d89eac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}