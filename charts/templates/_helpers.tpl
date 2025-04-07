
{{- define "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.fullname" -}}
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


{{- define "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.labels" -}}
helm.sh/chart: {{ include "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.chart" . }}
{{ include "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafd9e308-5600-442b-902c-dce609dbf9ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}