
{{- define "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.fullname" -}}
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


{{- define "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.labels" -}}
helm.sh/chart: {{ include "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.chart" . }}
{{ include "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo07f21ace-9c92-45cb-b80a-ea7cf40d2626.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}