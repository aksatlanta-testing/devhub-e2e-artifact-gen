
{{- define "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.fullname" -}}
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


{{- define "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.labels" -}}
helm.sh/chart: {{ include "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.chart" . }}
{{ include "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4b8411dd-736c-418b-8e77-6bf0275300ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}