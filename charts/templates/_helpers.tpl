
{{- define "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.fullname" -}}
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


{{- define "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.labels" -}}
helm.sh/chart: {{ include "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.chart" . }}
{{ include "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01fef2fe-ac0b-450c-9a21-4d19614c5bec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}