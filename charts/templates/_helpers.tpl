
{{- define "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.fullname" -}}
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


{{- define "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.labels" -}}
helm.sh/chart: {{ include "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.chart" . }}
{{ include "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob883ae92-f61c-4bbb-82d0-17db47e64cea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}