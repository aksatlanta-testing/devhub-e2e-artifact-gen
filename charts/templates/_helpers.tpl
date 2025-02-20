
{{- define "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.fullname" -}}
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


{{- define "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.labels" -}}
helm.sh/chart: {{ include "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.chart" . }}
{{ include "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo67258c10-d8f1-4040-9141-578b3c45ba8d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}