
{{- define "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.fullname" -}}
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


{{- define "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.labels" -}}
helm.sh/chart: {{ include "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.chart" . }}
{{ include "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc4fc3f2-b1b8-4c28-8b33-c1180375dc63.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}