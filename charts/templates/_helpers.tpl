
{{- define "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.fullname" -}}
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


{{- define "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.labels" -}}
helm.sh/chart: {{ include "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.chart" . }}
{{ include "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafa6eae2-d674-4b09-88b9-ac05e7f8fa23.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}