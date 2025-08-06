
{{- define "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.fullname" -}}
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


{{- define "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.labels" -}}
helm.sh/chart: {{ include "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.chart" . }}
{{ include "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3da2d3f-1ae0-4958-bd7f-ba9da1701dea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}