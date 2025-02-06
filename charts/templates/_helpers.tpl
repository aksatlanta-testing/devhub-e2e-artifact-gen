
{{- define "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.fullname" -}}
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


{{- define "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.labels" -}}
helm.sh/chart: {{ include "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.chart" . }}
{{ include "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7a2b8a7-c3ac-4490-9907-86d1033b367f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}