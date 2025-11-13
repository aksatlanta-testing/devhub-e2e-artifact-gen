
{{- define "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.fullname" -}}
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


{{- define "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.labels" -}}
helm.sh/chart: {{ include "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.chart" . }}
{{ include "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafeed777-d7a3-45ce-bbe5-80a8077ae1fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}