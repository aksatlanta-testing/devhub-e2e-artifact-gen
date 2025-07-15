
{{- define "go-echofa609189-c305-47b3-81ed-601d2a79abee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa609189-c305-47b3-81ed-601d2a79abee.fullname" -}}
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


{{- define "go-echofa609189-c305-47b3-81ed-601d2a79abee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa609189-c305-47b3-81ed-601d2a79abee.labels" -}}
helm.sh/chart: {{ include "go-echofa609189-c305-47b3-81ed-601d2a79abee.chart" . }}
{{ include "go-echofa609189-c305-47b3-81ed-601d2a79abee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa609189-c305-47b3-81ed-601d2a79abee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa609189-c305-47b3-81ed-601d2a79abee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}