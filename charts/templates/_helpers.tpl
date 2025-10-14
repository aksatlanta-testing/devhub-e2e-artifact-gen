
{{- define "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.fullname" -}}
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


{{- define "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.labels" -}}
helm.sh/chart: {{ include "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.chart" . }}
{{ include "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6781a97c-f76b-412c-9160-72bd14a4a22d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}