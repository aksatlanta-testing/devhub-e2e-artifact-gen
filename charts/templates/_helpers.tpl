
{{- define "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.fullname" -}}
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


{{- define "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.labels" -}}
helm.sh/chart: {{ include "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.chart" . }}
{{ include "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca6788d2-c037-41ba-9d12-9fc2dc0b5709.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}