
{{- define "go-echo422cc995-0094-4daf-b56f-f8930cd24409.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo422cc995-0094-4daf-b56f-f8930cd24409.fullname" -}}
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


{{- define "go-echo422cc995-0094-4daf-b56f-f8930cd24409.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo422cc995-0094-4daf-b56f-f8930cd24409.labels" -}}
helm.sh/chart: {{ include "go-echo422cc995-0094-4daf-b56f-f8930cd24409.chart" . }}
{{ include "go-echo422cc995-0094-4daf-b56f-f8930cd24409.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo422cc995-0094-4daf-b56f-f8930cd24409.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo422cc995-0094-4daf-b56f-f8930cd24409.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}