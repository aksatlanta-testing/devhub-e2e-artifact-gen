
{{- define "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.fullname" -}}
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


{{- define "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.labels" -}}
helm.sh/chart: {{ include "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.chart" . }}
{{ include "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4ef7f2a1-b7a1-48a8-9808-b4c2ea930333.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}