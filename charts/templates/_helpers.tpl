
{{- define "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.fullname" -}}
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


{{- define "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.labels" -}}
helm.sh/chart: {{ include "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.chart" . }}
{{ include "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo09d757d3-355e-48ce-aa9a-f565fd14910f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}