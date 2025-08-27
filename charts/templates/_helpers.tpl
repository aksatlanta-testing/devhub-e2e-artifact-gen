
{{- define "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.fullname" -}}
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


{{- define "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.labels" -}}
helm.sh/chart: {{ include "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.chart" . }}
{{ include "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa72b1c28-a729-4c9a-8161-cacd41537cfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}