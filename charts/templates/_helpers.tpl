
{{- define "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.fullname" -}}
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


{{- define "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.labels" -}}
helm.sh/chart: {{ include "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.chart" . }}
{{ include "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbd510bb-85a9-47be-8747-3f5d854c49fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}