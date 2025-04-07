
{{- define "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.fullname" -}}
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


{{- define "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.labels" -}}
helm.sh/chart: {{ include "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.chart" . }}
{{ include "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57142e93-fddf-4532-84cf-6cb7f6dd13cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}