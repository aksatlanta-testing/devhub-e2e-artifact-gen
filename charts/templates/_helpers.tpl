
{{- define "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.fullname" -}}
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


{{- define "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.labels" -}}
helm.sh/chart: {{ include "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.chart" . }}
{{ include "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb3467fd-2f32-43b2-a656-3f2856b94f05.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}