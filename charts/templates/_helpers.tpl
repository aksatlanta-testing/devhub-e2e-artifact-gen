
{{- define "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.fullname" -}}
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


{{- define "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.labels" -}}
helm.sh/chart: {{ include "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.chart" . }}
{{ include "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo88198ca6-fa33-43a4-a98f-0cd101d34eda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}