
{{- define "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.fullname" -}}
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


{{- define "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.labels" -}}
helm.sh/chart: {{ include "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.chart" . }}
{{ include "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobcc5bdd9-5540-4c88-884c-8c2dafb67c2e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}