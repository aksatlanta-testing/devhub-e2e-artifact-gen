
{{- define "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.fullname" -}}
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


{{- define "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.labels" -}}
helm.sh/chart: {{ include "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.chart" . }}
{{ include "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodca4918b-ac83-434a-a9c9-1d09593d4246.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}