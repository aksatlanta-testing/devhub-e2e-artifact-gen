
{{- define "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.fullname" -}}
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


{{- define "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.labels" -}}
helm.sh/chart: {{ include "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.chart" . }}
{{ include "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc50360d9-31f4-4370-9e8e-1b1afc9f287a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}