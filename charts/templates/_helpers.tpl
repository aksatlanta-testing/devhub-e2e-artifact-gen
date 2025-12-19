
{{- define "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.fullname" -}}
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


{{- define "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.labels" -}}
helm.sh/chart: {{ include "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.chart" . }}
{{ include "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa50fc6b9-1fd3-4c88-9f3f-525c2dd63786.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}