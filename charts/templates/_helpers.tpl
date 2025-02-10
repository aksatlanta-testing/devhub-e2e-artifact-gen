
{{- define "go-echo8809a411-c93f-4d89-902f-39f41383fdba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8809a411-c93f-4d89-902f-39f41383fdba.fullname" -}}
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


{{- define "go-echo8809a411-c93f-4d89-902f-39f41383fdba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8809a411-c93f-4d89-902f-39f41383fdba.labels" -}}
helm.sh/chart: {{ include "go-echo8809a411-c93f-4d89-902f-39f41383fdba.chart" . }}
{{ include "go-echo8809a411-c93f-4d89-902f-39f41383fdba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8809a411-c93f-4d89-902f-39f41383fdba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8809a411-c93f-4d89-902f-39f41383fdba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}