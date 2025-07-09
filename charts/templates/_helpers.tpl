
{{- define "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.fullname" -}}
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


{{- define "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.labels" -}}
helm.sh/chart: {{ include "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.chart" . }}
{{ include "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0ae96668-e578-4619-9a16-fe2d34f9530e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}