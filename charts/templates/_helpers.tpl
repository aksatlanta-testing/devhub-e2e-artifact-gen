
{{- define "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.fullname" -}}
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


{{- define "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.labels" -}}
helm.sh/chart: {{ include "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.chart" . }}
{{ include "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeebd3bb0-51ff-4502-aac3-f922929d391d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}