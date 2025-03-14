
{{- define "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.fullname" -}}
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


{{- define "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.labels" -}}
helm.sh/chart: {{ include "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.chart" . }}
{{ include "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8a066f2b-60ed-44eb-8847-bc1a27d16dcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}