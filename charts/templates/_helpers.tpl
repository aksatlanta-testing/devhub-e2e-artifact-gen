
{{- define "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.fullname" -}}
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


{{- define "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.labels" -}}
helm.sh/chart: {{ include "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.chart" . }}
{{ include "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8bd7651a-e046-40d3-8e73-cb08c066b3df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}