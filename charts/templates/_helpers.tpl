
{{- define "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.fullname" -}}
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


{{- define "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.labels" -}}
helm.sh/chart: {{ include "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.chart" . }}
{{ include "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5469da8-84da-43bd-bfd0-f75acb8901cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}