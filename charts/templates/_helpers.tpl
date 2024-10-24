
{{- define "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.fullname" -}}
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


{{- define "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.labels" -}}
helm.sh/chart: {{ include "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.chart" . }}
{{ include "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7fa6abee-a254-4355-8473-6c84c4f0ebcb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}