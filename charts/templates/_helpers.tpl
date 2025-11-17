
{{- define "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.fullname" -}}
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


{{- define "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.labels" -}}
helm.sh/chart: {{ include "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.chart" . }}
{{ include "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd623258-87f4-4e8b-92f3-c555760f6b0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}