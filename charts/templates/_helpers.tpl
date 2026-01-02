
{{- define "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.fullname" -}}
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


{{- define "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.labels" -}}
helm.sh/chart: {{ include "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.chart" . }}
{{ include "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebfd3bc3-761b-4817-95c5-6c19803fb597.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}