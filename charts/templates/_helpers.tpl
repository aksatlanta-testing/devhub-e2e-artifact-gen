
{{- define "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.fullname" -}}
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


{{- define "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.labels" -}}
helm.sh/chart: {{ include "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.chart" . }}
{{ include "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoccc9a97a-816a-4f3b-b3a2-2ee01923dae7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}