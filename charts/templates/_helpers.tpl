
{{- define "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.fullname" -}}
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


{{- define "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.labels" -}}
helm.sh/chart: {{ include "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.chart" . }}
{{ include "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0a7504c-3e1e-42bc-8213-fce0b195f188.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}