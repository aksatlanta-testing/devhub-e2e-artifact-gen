
{{- define "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.fullname" -}}
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


{{- define "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.labels" -}}
helm.sh/chart: {{ include "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.chart" . }}
{{ include "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo143e5ee0-0284-48b8-ab52-097e8fdcb647.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}