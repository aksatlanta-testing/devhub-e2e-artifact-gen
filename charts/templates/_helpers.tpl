
{{- define "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.fullname" -}}
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


{{- define "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.labels" -}}
helm.sh/chart: {{ include "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.chart" . }}
{{ include "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo248b517b-7fc8-47fb-8540-2fbce52dcf57.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}