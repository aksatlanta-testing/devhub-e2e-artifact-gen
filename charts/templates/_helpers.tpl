
{{- define "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.fullname" -}}
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


{{- define "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.labels" -}}
helm.sh/chart: {{ include "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.chart" . }}
{{ include "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc851c915-daf1-404d-a313-d23d826bc3e5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}