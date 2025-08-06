
{{- define "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.fullname" -}}
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


{{- define "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.labels" -}}
helm.sh/chart: {{ include "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.chart" . }}
{{ include "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod43538c8-3189-40cb-a76d-c80c1524fcae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}