
{{- define "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.fullname" -}}
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


{{- define "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.labels" -}}
helm.sh/chart: {{ include "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.chart" . }}
{{ include "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd235885-f37c-43d5-89d7-b82276a1eecb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}