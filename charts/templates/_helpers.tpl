
{{- define "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.fullname" -}}
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


{{- define "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.labels" -}}
helm.sh/chart: {{ include "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.chart" . }}
{{ include "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfcf5d7c-053d-4f66-bec8-2e9a0becb370.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}