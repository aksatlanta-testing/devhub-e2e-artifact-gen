
{{- define "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.fullname" -}}
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


{{- define "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.labels" -}}
helm.sh/chart: {{ include "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.chart" . }}
{{ include "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24a9a666-a2b4-4b71-b88f-c24102c0ecef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}