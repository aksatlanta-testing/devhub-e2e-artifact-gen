
{{- define "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.fullname" -}}
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


{{- define "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.labels" -}}
helm.sh/chart: {{ include "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.chart" . }}
{{ include "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3fc94d9-9529-4bc8-857a-dcf5211d7de2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}