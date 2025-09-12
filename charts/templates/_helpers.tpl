
{{- define "go-echo4bac720a-fa02-496c-831c-96bb213461ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bac720a-fa02-496c-831c-96bb213461ea.fullname" -}}
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


{{- define "go-echo4bac720a-fa02-496c-831c-96bb213461ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bac720a-fa02-496c-831c-96bb213461ea.labels" -}}
helm.sh/chart: {{ include "go-echo4bac720a-fa02-496c-831c-96bb213461ea.chart" . }}
{{ include "go-echo4bac720a-fa02-496c-831c-96bb213461ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4bac720a-fa02-496c-831c-96bb213461ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4bac720a-fa02-496c-831c-96bb213461ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}