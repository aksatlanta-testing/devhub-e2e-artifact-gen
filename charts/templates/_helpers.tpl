
{{- define "go-echob8d839b5-2077-4004-9fc0-56566065748b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8d839b5-2077-4004-9fc0-56566065748b.fullname" -}}
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


{{- define "go-echob8d839b5-2077-4004-9fc0-56566065748b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8d839b5-2077-4004-9fc0-56566065748b.labels" -}}
helm.sh/chart: {{ include "go-echob8d839b5-2077-4004-9fc0-56566065748b.chart" . }}
{{ include "go-echob8d839b5-2077-4004-9fc0-56566065748b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob8d839b5-2077-4004-9fc0-56566065748b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob8d839b5-2077-4004-9fc0-56566065748b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}