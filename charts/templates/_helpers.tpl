
{{- define "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.fullname" -}}
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


{{- define "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.labels" -}}
helm.sh/chart: {{ include "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.chart" . }}
{{ include "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocbfa2b7e-6e46-43b9-b059-ac10d3acf589.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}