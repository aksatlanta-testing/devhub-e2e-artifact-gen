
{{- define "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.fullname" -}}
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


{{- define "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.labels" -}}
helm.sh/chart: {{ include "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.chart" . }}
{{ include "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo89e7d72f-ed3b-4376-a8a8-0d5144dce168.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}