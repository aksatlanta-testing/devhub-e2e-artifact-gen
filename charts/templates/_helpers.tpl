
{{- define "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.fullname" -}}
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


{{- define "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.labels" -}}
helm.sh/chart: {{ include "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.chart" . }}
{{ include "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo94867f4e-40d8-4d3a-b5f5-fc464b34a87f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}