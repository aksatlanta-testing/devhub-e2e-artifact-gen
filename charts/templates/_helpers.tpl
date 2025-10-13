
{{- define "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.fullname" -}}
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


{{- define "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.labels" -}}
helm.sh/chart: {{ include "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.chart" . }}
{{ include "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoade2a949-efa8-4538-bba8-172077a9a5cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}