
{{- define "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.fullname" -}}
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


{{- define "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.labels" -}}
helm.sh/chart: {{ include "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.chart" . }}
{{ include "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2179f3c9-0df4-4c29-84af-ac4d04abe4fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}