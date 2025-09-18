
{{- define "go-echo8bb36828-ffca-4926-bd86-74645c00e678.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bb36828-ffca-4926-bd86-74645c00e678.fullname" -}}
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


{{- define "go-echo8bb36828-ffca-4926-bd86-74645c00e678.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bb36828-ffca-4926-bd86-74645c00e678.labels" -}}
helm.sh/chart: {{ include "go-echo8bb36828-ffca-4926-bd86-74645c00e678.chart" . }}
{{ include "go-echo8bb36828-ffca-4926-bd86-74645c00e678.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8bb36828-ffca-4926-bd86-74645c00e678.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8bb36828-ffca-4926-bd86-74645c00e678.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}