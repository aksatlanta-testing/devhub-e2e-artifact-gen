
{{- define "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.fullname" -}}
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


{{- define "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.labels" -}}
helm.sh/chart: {{ include "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.chart" . }}
{{ include "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda51494c-6437-4b19-a0e9-417adf6ba10b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}