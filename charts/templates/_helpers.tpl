
{{- define "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.fullname" -}}
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


{{- define "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.labels" -}}
helm.sh/chart: {{ include "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.chart" . }}
{{ include "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2f0aa302-1e01-4ffd-92a0-e41b2c90806e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}