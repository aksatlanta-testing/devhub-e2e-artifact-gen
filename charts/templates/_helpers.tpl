
{{- define "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.fullname" -}}
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


{{- define "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.labels" -}}
helm.sh/chart: {{ include "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.chart" . }}
{{ include "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2fdf5090-5e23-4450-a073-c7aadabd193a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}