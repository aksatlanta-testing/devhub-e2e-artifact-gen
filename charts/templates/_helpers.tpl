
{{- define "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.fullname" -}}
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


{{- define "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.labels" -}}
helm.sh/chart: {{ include "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.chart" . }}
{{ include "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0efa5bea-1a31-444e-a744-e993a718b3ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}