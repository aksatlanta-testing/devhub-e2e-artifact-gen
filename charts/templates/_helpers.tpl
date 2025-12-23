
{{- define "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.fullname" -}}
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


{{- define "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.labels" -}}
helm.sh/chart: {{ include "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.chart" . }}
{{ include "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1b30ceeb-c4df-462f-86fc-6cbd540fd28e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}