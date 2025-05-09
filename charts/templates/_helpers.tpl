
{{- define "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.fullname" -}}
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


{{- define "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.labels" -}}
helm.sh/chart: {{ include "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.chart" . }}
{{ include "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7e8c397d-6d6b-4617-95e2-84d30659089c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}