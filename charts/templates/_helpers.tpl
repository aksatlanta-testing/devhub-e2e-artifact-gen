
{{- define "go-echoee055c21-df52-4897-9a11-f779b60777de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee055c21-df52-4897-9a11-f779b60777de.fullname" -}}
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


{{- define "go-echoee055c21-df52-4897-9a11-f779b60777de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee055c21-df52-4897-9a11-f779b60777de.labels" -}}
helm.sh/chart: {{ include "go-echoee055c21-df52-4897-9a11-f779b60777de.chart" . }}
{{ include "go-echoee055c21-df52-4897-9a11-f779b60777de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee055c21-df52-4897-9a11-f779b60777de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee055c21-df52-4897-9a11-f779b60777de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}