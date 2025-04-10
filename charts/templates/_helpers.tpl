
{{- define "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.fullname" -}}
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


{{- define "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.labels" -}}
helm.sh/chart: {{ include "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.chart" . }}
{{ include "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffc1782d-2dcc-4ae2-af2a-db44338fc377.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}