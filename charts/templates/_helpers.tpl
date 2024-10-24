
{{- define "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.fullname" -}}
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


{{- define "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.labels" -}}
helm.sh/chart: {{ include "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.chart" . }}
{{ include "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacee8289-5543-410f-a7e4-7efb1d0f5810.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}