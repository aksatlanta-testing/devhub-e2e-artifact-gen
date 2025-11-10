
{{- define "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.fullname" -}}
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


{{- define "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.labels" -}}
helm.sh/chart: {{ include "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.chart" . }}
{{ include "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3050bd3-e0cc-415c-a4a8-930949504b2c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}