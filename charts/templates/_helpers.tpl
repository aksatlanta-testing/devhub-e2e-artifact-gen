
{{- define "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.fullname" -}}
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


{{- define "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.labels" -}}
helm.sh/chart: {{ include "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.chart" . }}
{{ include "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2083f284-f561-4c3b-b215-f9bc7acccf67.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}