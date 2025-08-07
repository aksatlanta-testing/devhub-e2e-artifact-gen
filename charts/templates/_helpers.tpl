
{{- define "go-echod9851031-fded-4f45-95cd-739cee1f973f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9851031-fded-4f45-95cd-739cee1f973f.fullname" -}}
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


{{- define "go-echod9851031-fded-4f45-95cd-739cee1f973f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9851031-fded-4f45-95cd-739cee1f973f.labels" -}}
helm.sh/chart: {{ include "go-echod9851031-fded-4f45-95cd-739cee1f973f.chart" . }}
{{ include "go-echod9851031-fded-4f45-95cd-739cee1f973f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9851031-fded-4f45-95cd-739cee1f973f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9851031-fded-4f45-95cd-739cee1f973f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}