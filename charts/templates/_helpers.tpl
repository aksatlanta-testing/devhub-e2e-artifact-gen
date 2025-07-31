
{{- define "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.fullname" -}}
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


{{- define "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.labels" -}}
helm.sh/chart: {{ include "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.chart" . }}
{{ include "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo12433466-41c0-48b3-ae86-3db7b21cffca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}