
{{- define "go-echoefea1453-ec91-4105-b620-caa47a66b17f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefea1453-ec91-4105-b620-caa47a66b17f.fullname" -}}
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


{{- define "go-echoefea1453-ec91-4105-b620-caa47a66b17f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefea1453-ec91-4105-b620-caa47a66b17f.labels" -}}
helm.sh/chart: {{ include "go-echoefea1453-ec91-4105-b620-caa47a66b17f.chart" . }}
{{ include "go-echoefea1453-ec91-4105-b620-caa47a66b17f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefea1453-ec91-4105-b620-caa47a66b17f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefea1453-ec91-4105-b620-caa47a66b17f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}