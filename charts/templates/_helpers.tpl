
{{- define "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.fullname" -}}
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


{{- define "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.labels" -}}
helm.sh/chart: {{ include "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.chart" . }}
{{ include "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4bcc87df-a729-4a63-b05d-b1e58daff464.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}