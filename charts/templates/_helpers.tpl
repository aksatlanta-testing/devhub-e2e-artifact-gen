
{{- define "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.fullname" -}}
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


{{- define "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.labels" -}}
helm.sh/chart: {{ include "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.chart" . }}
{{ include "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8574c33-a525-4a3a-b30b-8dfb75e5260a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}