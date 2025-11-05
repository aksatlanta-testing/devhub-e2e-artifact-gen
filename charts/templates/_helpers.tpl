
{{- define "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.fullname" -}}
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


{{- define "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.labels" -}}
helm.sh/chart: {{ include "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.chart" . }}
{{ include "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob99c468b-6bf2-43b2-8122-c885bb64ae3a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}