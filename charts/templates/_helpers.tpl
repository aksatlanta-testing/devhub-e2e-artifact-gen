
{{- define "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.fullname" -}}
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


{{- define "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.labels" -}}
helm.sh/chart: {{ include "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.chart" . }}
{{ include "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1026ab8e-ee16-4a47-ac3d-f53e6fb5b2ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}