
{{- define "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.fullname" -}}
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


{{- define "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.labels" -}}
helm.sh/chart: {{ include "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.chart" . }}
{{ include "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb435b50-18d3-4770-bb7e-1d2d72deb3fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}