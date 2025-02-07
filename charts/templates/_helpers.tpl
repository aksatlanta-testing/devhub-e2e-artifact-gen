
{{- define "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.fullname" -}}
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


{{- define "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.labels" -}}
helm.sh/chart: {{ include "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.chart" . }}
{{ include "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9002fd2e-df7c-47ba-8ad1-55d93d6f0602.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}