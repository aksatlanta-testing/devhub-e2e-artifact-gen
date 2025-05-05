
{{- define "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.fullname" -}}
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


{{- define "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.labels" -}}
helm.sh/chart: {{ include "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.chart" . }}
{{ include "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo30b8e105-e733-40e9-a588-c4c175ea45dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}