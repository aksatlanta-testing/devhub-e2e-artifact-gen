
{{- define "go-echod7e0d377-8588-4d37-894d-34cf2260a484.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7e0d377-8588-4d37-894d-34cf2260a484.fullname" -}}
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


{{- define "go-echod7e0d377-8588-4d37-894d-34cf2260a484.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7e0d377-8588-4d37-894d-34cf2260a484.labels" -}}
helm.sh/chart: {{ include "go-echod7e0d377-8588-4d37-894d-34cf2260a484.chart" . }}
{{ include "go-echod7e0d377-8588-4d37-894d-34cf2260a484.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7e0d377-8588-4d37-894d-34cf2260a484.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7e0d377-8588-4d37-894d-34cf2260a484.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}