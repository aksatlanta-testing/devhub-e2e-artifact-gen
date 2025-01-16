
{{- define "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.fullname" -}}
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


{{- define "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.labels" -}}
helm.sh/chart: {{ include "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.chart" . }}
{{ include "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo09bdc081-e546-4d7f-be71-f3d15122df2e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}