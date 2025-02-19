
{{- define "go-echoce32f844-76d3-4580-902d-6f94c92eae95.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce32f844-76d3-4580-902d-6f94c92eae95.fullname" -}}
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


{{- define "go-echoce32f844-76d3-4580-902d-6f94c92eae95.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce32f844-76d3-4580-902d-6f94c92eae95.labels" -}}
helm.sh/chart: {{ include "go-echoce32f844-76d3-4580-902d-6f94c92eae95.chart" . }}
{{ include "go-echoce32f844-76d3-4580-902d-6f94c92eae95.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce32f844-76d3-4580-902d-6f94c92eae95.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce32f844-76d3-4580-902d-6f94c92eae95.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}