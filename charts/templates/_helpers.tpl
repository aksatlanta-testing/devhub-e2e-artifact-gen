
{{- define "go-echo95947ed1-6656-45ce-82de-298438c3407b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95947ed1-6656-45ce-82de-298438c3407b.fullname" -}}
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


{{- define "go-echo95947ed1-6656-45ce-82de-298438c3407b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95947ed1-6656-45ce-82de-298438c3407b.labels" -}}
helm.sh/chart: {{ include "go-echo95947ed1-6656-45ce-82de-298438c3407b.chart" . }}
{{ include "go-echo95947ed1-6656-45ce-82de-298438c3407b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95947ed1-6656-45ce-82de-298438c3407b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95947ed1-6656-45ce-82de-298438c3407b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}