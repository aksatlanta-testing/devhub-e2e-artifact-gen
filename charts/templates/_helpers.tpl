
{{- define "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.fullname" -}}
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


{{- define "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.labels" -}}
helm.sh/chart: {{ include "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.chart" . }}
{{ include "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0d65f9a1-229e-4574-ad8f-fbc890fa6188.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}