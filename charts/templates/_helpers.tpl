
{{- define "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.fullname" -}}
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


{{- define "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.labels" -}}
helm.sh/chart: {{ include "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.chart" . }}
{{ include "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa70b31a-f3d0-443e-854d-d61d6817ef2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}