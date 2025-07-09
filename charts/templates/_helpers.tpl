
{{- define "go-echo64bd5033-3857-4717-ba97-49af79473bdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64bd5033-3857-4717-ba97-49af79473bdc.fullname" -}}
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


{{- define "go-echo64bd5033-3857-4717-ba97-49af79473bdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64bd5033-3857-4717-ba97-49af79473bdc.labels" -}}
helm.sh/chart: {{ include "go-echo64bd5033-3857-4717-ba97-49af79473bdc.chart" . }}
{{ include "go-echo64bd5033-3857-4717-ba97-49af79473bdc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo64bd5033-3857-4717-ba97-49af79473bdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo64bd5033-3857-4717-ba97-49af79473bdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}