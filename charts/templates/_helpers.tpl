
{{- define "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.fullname" -}}
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


{{- define "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.labels" -}}
helm.sh/chart: {{ include "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.chart" . }}
{{ include "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeabf928c-90fc-4710-a491-a153ba5aa85a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}