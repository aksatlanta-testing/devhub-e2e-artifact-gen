
{{- define "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.fullname" -}}
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


{{- define "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.labels" -}}
helm.sh/chart: {{ include "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.chart" . }}
{{ include "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod08832e6-5a64-4279-ac04-58086cfb5b7a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}