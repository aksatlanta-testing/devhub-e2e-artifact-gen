
{{- define "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.fullname" -}}
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


{{- define "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.labels" -}}
helm.sh/chart: {{ include "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.chart" . }}
{{ include "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod55b0978-71b9-4295-8a60-0be9876bea0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}