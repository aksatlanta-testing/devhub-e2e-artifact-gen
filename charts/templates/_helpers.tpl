
{{- define "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.fullname" -}}
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


{{- define "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.labels" -}}
helm.sh/chart: {{ include "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.chart" . }}
{{ include "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe867eefe-3df9-4874-a46a-a8f107caf79f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}