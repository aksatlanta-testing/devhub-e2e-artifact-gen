
{{- define "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.fullname" -}}
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


{{- define "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.labels" -}}
helm.sh/chart: {{ include "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.chart" . }}
{{ include "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo22ab39d9-8915-4e2f-88f5-952cb0606a69.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}