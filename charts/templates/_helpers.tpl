
{{- define "go-echodd344071-46b9-4b30-b480-03fcdd06877f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd344071-46b9-4b30-b480-03fcdd06877f.fullname" -}}
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


{{- define "go-echodd344071-46b9-4b30-b480-03fcdd06877f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd344071-46b9-4b30-b480-03fcdd06877f.labels" -}}
helm.sh/chart: {{ include "go-echodd344071-46b9-4b30-b480-03fcdd06877f.chart" . }}
{{ include "go-echodd344071-46b9-4b30-b480-03fcdd06877f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd344071-46b9-4b30-b480-03fcdd06877f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd344071-46b9-4b30-b480-03fcdd06877f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}