
{{- define "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.fullname" -}}
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


{{- define "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.labels" -}}
helm.sh/chart: {{ include "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.chart" . }}
{{ include "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08246699-1c9e-4f8f-aa82-d8d156e3d378.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}