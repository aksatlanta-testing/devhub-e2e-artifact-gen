
{{- define "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.fullname" -}}
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


{{- define "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.labels" -}}
helm.sh/chart: {{ include "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.chart" . }}
{{ include "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6fa9d663-f75b-4ee5-ba0d-7ca20b2637fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}