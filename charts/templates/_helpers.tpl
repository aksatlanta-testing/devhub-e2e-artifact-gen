
{{- define "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.fullname" -}}
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


{{- define "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.labels" -}}
helm.sh/chart: {{ include "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.chart" . }}
{{ include "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8944b0c-a072-40dc-8b0c-41341babbcce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}