
{{- define "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.fullname" -}}
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


{{- define "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.labels" -}}
helm.sh/chart: {{ include "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.chart" . }}
{{ include "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57c84f4a-c0ae-4414-8170-bfb2aea8530f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}