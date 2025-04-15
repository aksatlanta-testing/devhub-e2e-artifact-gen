
{{- define "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.fullname" -}}
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


{{- define "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.labels" -}}
helm.sh/chart: {{ include "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.chart" . }}
{{ include "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe81a509d-de31-4d31-8a63-b3334c1f6e35.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}