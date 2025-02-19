
{{- define "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.fullname" -}}
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


{{- define "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.labels" -}}
helm.sh/chart: {{ include "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.chart" . }}
{{ include "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod91cab70-5e2d-472b-a5cb-6f4f6956b381.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}