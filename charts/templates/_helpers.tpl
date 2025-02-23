
{{- define "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.fullname" -}}
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


{{- define "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.labels" -}}
helm.sh/chart: {{ include "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.chart" . }}
{{ include "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d15b6d0-c9ed-4b73-9ea4-bbe05d5c37ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}