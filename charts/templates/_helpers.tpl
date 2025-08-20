
{{- define "go-echoe02bad3c-4028-4932-8e81-266694a3317d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe02bad3c-4028-4932-8e81-266694a3317d.fullname" -}}
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


{{- define "go-echoe02bad3c-4028-4932-8e81-266694a3317d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe02bad3c-4028-4932-8e81-266694a3317d.labels" -}}
helm.sh/chart: {{ include "go-echoe02bad3c-4028-4932-8e81-266694a3317d.chart" . }}
{{ include "go-echoe02bad3c-4028-4932-8e81-266694a3317d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe02bad3c-4028-4932-8e81-266694a3317d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe02bad3c-4028-4932-8e81-266694a3317d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}