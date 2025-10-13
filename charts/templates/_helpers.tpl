
{{- define "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.fullname" -}}
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


{{- define "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.labels" -}}
helm.sh/chart: {{ include "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.chart" . }}
{{ include "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1290d19f-e045-420e-8630-35d084f8e4cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}