
{{- define "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.fullname" -}}
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


{{- define "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.labels" -}}
helm.sh/chart: {{ include "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.chart" . }}
{{ include "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4311eff-b999-4c8f-846a-c79e47c2d25f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}