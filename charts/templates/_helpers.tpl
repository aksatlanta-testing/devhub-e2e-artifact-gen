
{{- define "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.fullname" -}}
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


{{- define "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.labels" -}}
helm.sh/chart: {{ include "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.chart" . }}
{{ include "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo38eca7c2-f0b2-403c-8779-7136c9cbee11.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}