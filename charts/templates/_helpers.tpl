
{{- define "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.fullname" -}}
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


{{- define "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.labels" -}}
helm.sh/chart: {{ include "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.chart" . }}
{{ include "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod12060d6-7a9c-4839-b458-1209a1dd64df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}