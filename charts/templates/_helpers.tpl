
{{- define "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.fullname" -}}
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


{{- define "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.labels" -}}
helm.sh/chart: {{ include "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.chart" . }}
{{ include "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d720c5a-5239-476f-877c-8e9cdf947bce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}