
{{- define "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.fullname" -}}
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


{{- define "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.labels" -}}
helm.sh/chart: {{ include "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.chart" . }}
{{ include "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6a712453-dfc5-47c7-b2a1-3d3ed49fbc4e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}