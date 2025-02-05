
{{- define "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.fullname" -}}
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


{{- define "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.labels" -}}
helm.sh/chart: {{ include "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.chart" . }}
{{ include "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc4e414e-9cd1-47a7-b9e9-8ce26bb63b94.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}