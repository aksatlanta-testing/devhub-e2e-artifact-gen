
{{- define "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.fullname" -}}
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


{{- define "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.labels" -}}
helm.sh/chart: {{ include "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.chart" . }}
{{ include "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob4f54c7a-f9f1-4c70-aaaa-443fff89908d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}