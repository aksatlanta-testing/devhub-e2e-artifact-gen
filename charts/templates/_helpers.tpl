
{{- define "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.fullname" -}}
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


{{- define "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.labels" -}}
helm.sh/chart: {{ include "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.chart" . }}
{{ include "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo74e055bb-0ed4-4ffd-8cca-c808c203048c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}