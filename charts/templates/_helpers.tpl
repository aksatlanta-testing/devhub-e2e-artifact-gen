
{{- define "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.fullname" -}}
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


{{- define "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.labels" -}}
helm.sh/chart: {{ include "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.chart" . }}
{{ include "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc11a6910-3fdf-4ce9-8bc8-f57a1db6407d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}