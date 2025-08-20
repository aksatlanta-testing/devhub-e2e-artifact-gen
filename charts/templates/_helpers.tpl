
{{- define "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.fullname" -}}
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


{{- define "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.labels" -}}
helm.sh/chart: {{ include "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.chart" . }}
{{ include "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac559a81-acb1-45cc-9a71-ce51541c931a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}