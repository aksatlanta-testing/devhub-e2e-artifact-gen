
{{- define "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.fullname" -}}
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


{{- define "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.labels" -}}
helm.sh/chart: {{ include "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.chart" . }}
{{ include "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe29e024e-4c09-4b63-8718-34b1d745686e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}