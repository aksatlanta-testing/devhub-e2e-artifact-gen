
{{- define "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.fullname" -}}
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


{{- define "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.labels" -}}
helm.sh/chart: {{ include "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.chart" . }}
{{ include "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2808fbff-231c-4012-a95f-f7c7ba60aafa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}