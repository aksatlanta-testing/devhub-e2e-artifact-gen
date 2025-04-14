
{{- define "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.fullname" -}}
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


{{- define "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.labels" -}}
helm.sh/chart: {{ include "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.chart" . }}
{{ include "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce060579-0c78-494f-bb7a-0f7ec751fa2a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}