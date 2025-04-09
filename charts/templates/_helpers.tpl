
{{- define "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.fullname" -}}
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


{{- define "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.labels" -}}
helm.sh/chart: {{ include "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.chart" . }}
{{ include "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2a3f6c4-f5ef-4030-b7e2-d1f9c540b38c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}