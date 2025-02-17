
{{- define "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.fullname" -}}
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


{{- define "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.labels" -}}
helm.sh/chart: {{ include "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.chart" . }}
{{ include "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac55a6a9-df68-4e4b-b23c-c7b9efb6247c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}