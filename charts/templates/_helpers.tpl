
{{- define "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.fullname" -}}
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


{{- define "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.labels" -}}
helm.sh/chart: {{ include "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.chart" . }}
{{ include "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae482315-9d5b-4ea8-b3a4-a1cc5acd2068.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}