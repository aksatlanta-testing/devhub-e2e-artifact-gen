
{{- define "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.fullname" -}}
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


{{- define "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.labels" -}}
helm.sh/chart: {{ include "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.chart" . }}
{{ include "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa79a340-d33d-43e8-87e2-18f3414b282b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}