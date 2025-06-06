
{{- define "go-echoac899654-d288-47dd-b087-8a64accf81cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac899654-d288-47dd-b087-8a64accf81cd.fullname" -}}
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


{{- define "go-echoac899654-d288-47dd-b087-8a64accf81cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac899654-d288-47dd-b087-8a64accf81cd.labels" -}}
helm.sh/chart: {{ include "go-echoac899654-d288-47dd-b087-8a64accf81cd.chart" . }}
{{ include "go-echoac899654-d288-47dd-b087-8a64accf81cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac899654-d288-47dd-b087-8a64accf81cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac899654-d288-47dd-b087-8a64accf81cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}