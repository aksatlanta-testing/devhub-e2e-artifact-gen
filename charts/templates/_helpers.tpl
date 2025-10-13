
{{- define "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.fullname" -}}
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


{{- define "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.labels" -}}
helm.sh/chart: {{ include "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.chart" . }}
{{ include "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe30efad4-7b6f-4b64-a3e0-7059a457bd9b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}