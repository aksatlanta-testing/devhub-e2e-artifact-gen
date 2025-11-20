
{{- define "go-echobed60ea2-b6ac-40f2-9424-27b075549623.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobed60ea2-b6ac-40f2-9424-27b075549623.fullname" -}}
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


{{- define "go-echobed60ea2-b6ac-40f2-9424-27b075549623.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobed60ea2-b6ac-40f2-9424-27b075549623.labels" -}}
helm.sh/chart: {{ include "go-echobed60ea2-b6ac-40f2-9424-27b075549623.chart" . }}
{{ include "go-echobed60ea2-b6ac-40f2-9424-27b075549623.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobed60ea2-b6ac-40f2-9424-27b075549623.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobed60ea2-b6ac-40f2-9424-27b075549623.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}