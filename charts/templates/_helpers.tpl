
{{- define "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.fullname" -}}
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


{{- define "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.labels" -}}
helm.sh/chart: {{ include "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.chart" . }}
{{ include "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof47f8675-ee88-4a1d-a350-a1573fb1afe1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}