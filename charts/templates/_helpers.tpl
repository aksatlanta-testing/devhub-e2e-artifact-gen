
{{- define "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.fullname" -}}
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


{{- define "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.labels" -}}
helm.sh/chart: {{ include "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.chart" . }}
{{ include "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4a876de-67a5-441e-9ee8-0ba9af92683f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}