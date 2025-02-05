
{{- define "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.fullname" -}}
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


{{- define "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.labels" -}}
helm.sh/chart: {{ include "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.chart" . }}
{{ include "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo94943bae-cb43-4f45-8fdd-72301c794a0b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}