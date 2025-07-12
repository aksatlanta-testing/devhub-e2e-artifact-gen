
{{- define "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.fullname" -}}
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


{{- define "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.labels" -}}
helm.sh/chart: {{ include "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.chart" . }}
{{ include "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1723dc6-9eac-45f4-86e2-b6dabde82e8e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}