
{{- define "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.fullname" -}}
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


{{- define "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.labels" -}}
helm.sh/chart: {{ include "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.chart" . }}
{{ include "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41a66375-1670-4e1f-91a4-7a6abd29d67d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}