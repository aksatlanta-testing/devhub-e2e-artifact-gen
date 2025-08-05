
{{- define "go-echobe513188-726b-4411-9998-d3cb90ed2dec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe513188-726b-4411-9998-d3cb90ed2dec.fullname" -}}
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


{{- define "go-echobe513188-726b-4411-9998-d3cb90ed2dec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe513188-726b-4411-9998-d3cb90ed2dec.labels" -}}
helm.sh/chart: {{ include "go-echobe513188-726b-4411-9998-d3cb90ed2dec.chart" . }}
{{ include "go-echobe513188-726b-4411-9998-d3cb90ed2dec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe513188-726b-4411-9998-d3cb90ed2dec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe513188-726b-4411-9998-d3cb90ed2dec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}