
{{- define "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.fullname" -}}
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


{{- define "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.labels" -}}
helm.sh/chart: {{ include "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.chart" . }}
{{ include "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo543b468b-46c5-41b3-8297-f5fc48eda25f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}