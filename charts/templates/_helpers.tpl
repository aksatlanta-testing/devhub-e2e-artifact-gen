
{{- define "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.fullname" -}}
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


{{- define "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.labels" -}}
helm.sh/chart: {{ include "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.chart" . }}
{{ include "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo026e448e-a6f4-4bc8-9fbb-026ce2a2ba3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}