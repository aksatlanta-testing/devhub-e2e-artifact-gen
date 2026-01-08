
{{- define "go-echofe571edf-35ad-4094-a35c-201aa00199be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe571edf-35ad-4094-a35c-201aa00199be.fullname" -}}
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


{{- define "go-echofe571edf-35ad-4094-a35c-201aa00199be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe571edf-35ad-4094-a35c-201aa00199be.labels" -}}
helm.sh/chart: {{ include "go-echofe571edf-35ad-4094-a35c-201aa00199be.chart" . }}
{{ include "go-echofe571edf-35ad-4094-a35c-201aa00199be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe571edf-35ad-4094-a35c-201aa00199be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe571edf-35ad-4094-a35c-201aa00199be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}