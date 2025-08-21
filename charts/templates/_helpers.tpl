
{{- define "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.fullname" -}}
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


{{- define "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.labels" -}}
helm.sh/chart: {{ include "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.chart" . }}
{{ include "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoece2b34e-b05f-47b2-8bac-ca4ac5eb9448.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}