
{{- define "go-echo3622f452-136e-4abf-8f90-6939a461a67c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3622f452-136e-4abf-8f90-6939a461a67c.fullname" -}}
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


{{- define "go-echo3622f452-136e-4abf-8f90-6939a461a67c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3622f452-136e-4abf-8f90-6939a461a67c.labels" -}}
helm.sh/chart: {{ include "go-echo3622f452-136e-4abf-8f90-6939a461a67c.chart" . }}
{{ include "go-echo3622f452-136e-4abf-8f90-6939a461a67c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3622f452-136e-4abf-8f90-6939a461a67c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3622f452-136e-4abf-8f90-6939a461a67c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}