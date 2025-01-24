
{{- define "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.fullname" -}}
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


{{- define "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.labels" -}}
helm.sh/chart: {{ include "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.chart" . }}
{{ include "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c0b80bf-c1b9-4b42-a4f1-95747b64964e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}