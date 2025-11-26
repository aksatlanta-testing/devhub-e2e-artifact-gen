
{{- define "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.fullname" -}}
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


{{- define "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.labels" -}}
helm.sh/chart: {{ include "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.chart" . }}
{{ include "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo63ea40cf-7254-4e6c-a8ae-f4ea6eb8efbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}