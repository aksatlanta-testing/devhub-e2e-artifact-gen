
{{- define "go-echo88920e23-03d0-444b-a344-6424dd244449.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88920e23-03d0-444b-a344-6424dd244449.fullname" -}}
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


{{- define "go-echo88920e23-03d0-444b-a344-6424dd244449.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88920e23-03d0-444b-a344-6424dd244449.labels" -}}
helm.sh/chart: {{ include "go-echo88920e23-03d0-444b-a344-6424dd244449.chart" . }}
{{ include "go-echo88920e23-03d0-444b-a344-6424dd244449.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo88920e23-03d0-444b-a344-6424dd244449.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo88920e23-03d0-444b-a344-6424dd244449.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}