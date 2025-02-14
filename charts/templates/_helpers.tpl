
{{- define "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.fullname" -}}
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


{{- define "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.labels" -}}
helm.sh/chart: {{ include "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.chart" . }}
{{ include "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe09078e5-580d-4f33-81cd-8656e76b5ec2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}