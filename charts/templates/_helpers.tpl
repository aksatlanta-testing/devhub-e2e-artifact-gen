
{{- define "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.fullname" -}}
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


{{- define "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.labels" -}}
helm.sh/chart: {{ include "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.chart" . }}
{{ include "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo50efac14-fffe-41b8-8a06-6da4daa2e01a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}