
{{- define "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.fullname" -}}
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


{{- define "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.labels" -}}
helm.sh/chart: {{ include "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.chart" . }}
{{ include "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo77fbf439-c22e-4744-af77-d63f05c9265c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}