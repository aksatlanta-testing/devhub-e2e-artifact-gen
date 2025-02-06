
{{- define "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.fullname" -}}
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


{{- define "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.labels" -}}
helm.sh/chart: {{ include "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.chart" . }}
{{ include "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebc5f007-65ad-4f62-8f57-cfebef6674fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}