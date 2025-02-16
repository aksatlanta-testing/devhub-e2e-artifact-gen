
{{- define "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.fullname" -}}
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


{{- define "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.labels" -}}
helm.sh/chart: {{ include "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.chart" . }}
{{ include "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed0e8107-2b7b-4b89-ad53-d412aec521cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}