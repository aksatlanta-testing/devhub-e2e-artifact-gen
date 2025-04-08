
{{- define "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.fullname" -}}
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


{{- define "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.labels" -}}
helm.sh/chart: {{ include "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.chart" . }}
{{ include "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61da38f1-7689-4f0b-8e06-6eda14ef59cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}