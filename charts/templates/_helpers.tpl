
{{- define "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.fullname" -}}
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


{{- define "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.labels" -}}
helm.sh/chart: {{ include "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.chart" . }}
{{ include "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4101fde9-6b2c-4d01-a626-f9dcf08b7f69.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}