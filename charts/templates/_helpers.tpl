
{{- define "go-echo020d634b-fa18-4260-b851-be0bd00693fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo020d634b-fa18-4260-b851-be0bd00693fa.fullname" -}}
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


{{- define "go-echo020d634b-fa18-4260-b851-be0bd00693fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo020d634b-fa18-4260-b851-be0bd00693fa.labels" -}}
helm.sh/chart: {{ include "go-echo020d634b-fa18-4260-b851-be0bd00693fa.chart" . }}
{{ include "go-echo020d634b-fa18-4260-b851-be0bd00693fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo020d634b-fa18-4260-b851-be0bd00693fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo020d634b-fa18-4260-b851-be0bd00693fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}