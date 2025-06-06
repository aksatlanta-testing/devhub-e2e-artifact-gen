
{{- define "go-echof89c0959-672d-482a-ba96-635d9106d74e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof89c0959-672d-482a-ba96-635d9106d74e.fullname" -}}
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


{{- define "go-echof89c0959-672d-482a-ba96-635d9106d74e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof89c0959-672d-482a-ba96-635d9106d74e.labels" -}}
helm.sh/chart: {{ include "go-echof89c0959-672d-482a-ba96-635d9106d74e.chart" . }}
{{ include "go-echof89c0959-672d-482a-ba96-635d9106d74e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof89c0959-672d-482a-ba96-635d9106d74e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof89c0959-672d-482a-ba96-635d9106d74e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}