
{{- define "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.fullname" -}}
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


{{- define "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.labels" -}}
helm.sh/chart: {{ include "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.chart" . }}
{{ include "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5a3c15c8-2a40-43a5-bbe7-ae17933311af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}