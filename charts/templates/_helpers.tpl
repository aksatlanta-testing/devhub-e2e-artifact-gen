
{{- define "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.fullname" -}}
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


{{- define "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.labels" -}}
helm.sh/chart: {{ include "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.chart" . }}
{{ include "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo196726ba-8cec-46ef-93f2-7d3ef29a113d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}