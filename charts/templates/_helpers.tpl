
{{- define "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.fullname" -}}
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


{{- define "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.labels" -}}
helm.sh/chart: {{ include "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.chart" . }}
{{ include "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo192efdd3-ace3-4fb9-a517-de2ac401282f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}