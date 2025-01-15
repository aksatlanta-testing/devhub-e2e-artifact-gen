
{{- define "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.fullname" -}}
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


{{- define "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.labels" -}}
helm.sh/chart: {{ include "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.chart" . }}
{{ include "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob49b7e63-d2c2-4b22-b645-d95db7e17bd9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}