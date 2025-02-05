
{{- define "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.fullname" -}}
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


{{- define "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.labels" -}}
helm.sh/chart: {{ include "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.chart" . }}
{{ include "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca7d82b1-73b7-419b-bdd6-701b0a9824ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}