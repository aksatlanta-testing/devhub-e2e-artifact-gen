
{{- define "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.fullname" -}}
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


{{- define "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.labels" -}}
helm.sh/chart: {{ include "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.chart" . }}
{{ include "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5c237b9-f753-44bd-b906-e1c0d09bfef7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}