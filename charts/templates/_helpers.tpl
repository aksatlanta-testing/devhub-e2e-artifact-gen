
{{- define "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.fullname" -}}
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


{{- define "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.labels" -}}
helm.sh/chart: {{ include "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.chart" . }}
{{ include "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0061270-6bf3-4f48-98d9-5fd1f666a9ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}